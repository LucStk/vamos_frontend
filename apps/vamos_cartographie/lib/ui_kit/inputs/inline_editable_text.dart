import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:domain_core/domain_core.dart';

class InlineEditableText extends StatefulWidget {
  const InlineEditableText({
    super.key,
    required this.text,
    required this.onSave,
    this.placeholder,
    this.canEdit = false,
    this.style,
    this.allowEmpty = true,
    this.maxLength = 60,
    this.multiline = false,
    this.maxLines = 2,
    this.minFontSize = 11,
  });

  final String text;
  final bool canEdit;
  final TextStyle? style;
  final String? placeholder;
  final bool allowEmpty;

  /// Longueur maximale acceptée. Le champ bloque la saisie au-delà.
  final int maxLength;
  final bool multiline;

  /// Nombre de lignes avant de rétrécir la police puis de tronquer.
  final int maxLines;

  /// Taille plancher : en dessous, le texte est tronqué plutôt que réduit.
  final double minFontSize;

  /// Renvoie un [Failure] (ou lève) en cas d'échec : le widget reste alors
  /// en édition et le texte saisi n'est pas perdu.
  final Future<Failure?> Function(String value) onSave;

  @override
  State<InlineEditableText> createState() => _InlineEditableTextState();
}

class _InlineEditableTextState extends State<InlineEditableText> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  bool _editing = false;
  bool _saving = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  /// Un tap ailleurs (carte comprise) fait perdre le focus : on enregistre
  /// pour ne pas perdre la saisie, comme le ferait une validation.
  void _onFocusChange() {
    if (_focusNode.hasFocus || !_editing || _saving) return;
    _submit();
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(InlineEditableText old) {
    super.didUpdateWidget(old);
    // Droit retiré pendant l'édition (déconnexion, changement d'élément...).
    if (_editing && !widget.canEdit) _cancel();
    // On ne touche jamais au controller si widget.text change pendant
    // l'édition : on ne veut pas écraser la saisie en cours.
  }

  TextStyle get _baseStyle =>
      widget.style ?? DefaultTextStyle.of(context).style;

  void _start() {
    _controller.value = TextEditingValue(
      text: widget.text,
      selection: TextSelection(baseOffset: 0, extentOffset: widget.text.length),
    );
    setState(() {
      _editing = true;
      _error = null;
    });
  }

  void _cancel() {
    setState(() {
      _editing = false;
      _saving = false;
      _error = null;
    });
    _focusNode.unfocus();
  }

  Future<void> _submit() async {
    if (_saving) return;
    final value = _controller.text.trim();

    if (value.isEmpty && !widget.allowEmpty) {
      setState(() => _error = 'Ce champ ne peut pas être vide');
      return;
    }
    if (value.characters.length > widget.maxLength) {
      setState(() => _error = '${widget.maxLength} caractères maximum');
      return;
    }
    if (value == widget.text) return _cancel(); // rien à envoyer

    setState(() {
      _saving = true;
      _error = null;
    });
    try {
      final failure = await widget.onSave(value);
      if (!mounted) return;

      if (failure != null) {
        setState(() {
          _saving = false;
          _error = 'Échec de l’enregistrement, réessaie';
        });
        return;
      }

      setState(() {
        _saving = false;
        _editing = false;
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _saving = false;
        _error = 'Échec de l’enregistrement, réessaie';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_editing) {
      return Row(
        children: [
          Expanded(
            child: _ShrinkToFitText(
              text: widget.text,
              style: _baseStyle,
              maxLines: widget.maxLines,
              minFontSize: widget.minFontSize,
            ),
          ),
          if (widget.canEdit)
            IconButton(
              icon: const Icon(Icons.edit_outlined, size: 20),
              tooltip: 'Modifier',
              visualDensity: VisualDensity.compact,
              onPressed: _start,
            ),
        ],
      );
    }

    return CallbackShortcuts(
      bindings: {const SingleActivator(LogicalKeyboardKey.escape): _cancel},
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                // Même taille qu'en lecture : pas de saut visuel à l'ouverture.
                final style = _fittedStyle(
                  text: _controller.text.isEmpty
                      ? widget.text
                      : _controller.text,
                  style: _baseStyle,
                  maxWidth: constraints.maxWidth,
                  maxLines: widget.multiline ? 4 : widget.maxLines,
                  minFontSize: widget.minFontSize,
                  textScaler: MediaQuery.textScalerOf(context),
                );

                return TextField(
                  controller: _controller,
                  focusNode: _focusNode,
                  autofocus: true,
                  enabled: !_saving,
                  style: style,
                  maxLength: widget.maxLength,
                  maxLines: widget.multiline ? null : widget.maxLines,
                  minLines: 1,
                  textInputAction: widget.multiline
                      ? TextInputAction.newline
                      : TextInputAction.done,
                  onChanged: (_) => setState(() {}), // réajuste la police
                  onSubmitted: widget.multiline ? null : (_) => _submit(),
                  decoration: InputDecoration(
                    isDense: true,
                    counterText: '',
                    errorText: _error,
                    hintText: widget.placeholder,
                    hintStyle: style.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                );
              },
            ),
          ),
          if (_saving)
            const Padding(
              padding: EdgeInsets.all(12),
              child: SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            )
          else ...[
            if (widget.multiline)
              IconButton(
                icon: const Icon(Icons.check),
                tooltip: 'Enregistrer',
                visualDensity: VisualDensity.compact,
                onPressed: _submit,
              ),
            IconButton(
              icon: const Icon(Icons.close),
              tooltip: 'Annuler',
              visualDensity: VisualDensity.compact,
              onPressed: _cancel,
            ),
          ],
        ],
      ),
    );
  }
}

/// Texte qui réduit sa police jusqu'à tenir dans [maxLines], puis tronque.
class _ShrinkToFitText extends StatelessWidget {
  const _ShrinkToFitText({
    required this.text,
    required this.style,
    required this.maxLines,
    required this.minFontSize,
  });

  final String text;
  final TextStyle style;
  final int maxLines;
  final double minFontSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final fitted = _fittedStyle(
          text: text,
          style: style,
          maxWidth: constraints.maxWidth,
          maxLines: maxLines,
          minFontSize: minFontSize,
          textScaler: MediaQuery.textScalerOf(context),
        );

        return Text(
          text,
          style: fitted,
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
        );
      },
    );
  }
}

/// Cherche la plus grande taille de police (par pas de 0.5) telle que [text]
/// tienne en [maxLines] dans [maxWidth]. S'arrête à [minFontSize].
TextStyle _fittedStyle({
  required String text,
  required TextStyle style,
  required double maxWidth,
  required int maxLines,
  required double minFontSize,
  required TextScaler textScaler,
}) {
  final base = style.fontSize ?? 16;
  if (text.isEmpty || !maxWidth.isFinite || maxWidth <= 0) return style;

  var size = base;
  while (size > minFontSize) {
    final painter = TextPainter(
      text: TextSpan(
        text: text,
        style: style.copyWith(fontSize: size),
      ),
      maxLines: maxLines,
      textDirection: TextDirection.ltr,
      textScaler: textScaler,
    )..layout(maxWidth: maxWidth);

    if (!painter.didExceedMaxLines) break;
    size -= 0.5;
  }

  return style.copyWith(fontSize: size.clamp(minFontSize, base));
}
