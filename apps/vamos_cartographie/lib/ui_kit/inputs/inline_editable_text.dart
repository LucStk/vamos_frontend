import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:domain_core/domain_core.dart';

class InlineEditableText extends StatefulWidget {
  const InlineEditableText({
    super.key,
    required this.text,
    required this.onSave,
    this.canEdit = false,
    this.style,
    this.maxLength = 120,
    this.multiline = false,
  });

  final String text;
  final bool canEdit;
  final TextStyle? style;
  final int maxLength;
  final bool multiline;

  /// Doit lever une exception en cas d'échec : le widget reste alors
  /// en édition et le texte saisi n'est pas perdu.
  final Future<Failure?> Function(String value) onSave;

  @override
  State<InlineEditableText> createState() => _InlineEditableTextState();
}

class _InlineEditableTextState extends State<InlineEditableText> {
  final _controller = TextEditingController();
  bool _editing = false;
  bool _saving = false;
  String? _error;

  @override
  void didUpdateWidget(InlineEditableText old) {
    super.didUpdateWidget(old);
    // Droit retiré pendant l'édition (déconnexion, changement d'élément...).
    if (_editing && !widget.canEdit) _cancel();
    // On ne touche jamais au controller si widget.text change pendant
    // l'édition : on ne veut pas écraser la saisie en cours.
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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

  void _cancel() => setState(() {
    _editing = false;
    _saving = false;
    _error = null;
  });

  Future<void> _submit() async {
    if (_saving) return;
    final value = _controller.text.trim();

    if (value.isEmpty) {
      setState(() => _error = 'Ce champ ne peut pas être vide');
      return;
    }
    if (value == widget.text) return _cancel(); // rien à envoyer

    setState(() {
      _saving = true;
      _error = null;
    });
    try {
      await widget.onSave(value);
      if (!mounted) return;
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
          Expanded(child: Text(widget.text, style: widget.style)),
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
            child: TextField(
              controller: _controller,
              autofocus: true,
              enabled: !_saving,
              style: widget.style,
              maxLength: widget.maxLength,
              maxLines: widget.multiline ? null : 1,
              textInputAction: widget.multiline
                  ? TextInputAction.newline
                  : TextInputAction.done,
              onSubmitted: widget.multiline ? null : (_) => _submit(),
              decoration: InputDecoration(
                isDense: true,
                counterText: '',
                errorText: _error,
              ),
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
