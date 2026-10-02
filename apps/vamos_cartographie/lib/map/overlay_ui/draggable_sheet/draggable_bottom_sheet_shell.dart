import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '/map/map.dart'; // DragHintHeader
import 'deferred_notifier.dart';
import 'sheet_metrics.dart';

class DraggableBottomSheetShell extends StatefulWidget {
  /// Contenu compact : affiché au repos, et utilisé pour mesurer la taille initiale.
  final Widget compactContent;

  /// Contenu affiché dès que la sheet est dépliée.
  final Widget expandedContent;

  /// Affiché au-dessus du contenu (hauteur nulle au repos).
  final Widget? header;

  final double maxChildSize;

  const DraggableBottomSheetShell({
    super.key,
    required this.compactContent,
    required this.expandedContent,
    this.header,
    this.maxChildSize = 0.90,
  });

  @override
  State<DraggableBottomSheetShell> createState() =>
      _DraggableBottomSheetShellState();
}

class _DraggableBottomSheetShellState extends State<DraggableBottomSheetShell> {
  final _measureKey = GlobalKey();
  final _isAtMin = DeferredNotifier<bool>(true);
  double? _compactHeight;

  @override
  void dispose() {
    _isAtMin.dispose();
    super.dispose();
  }

  /// Poignée + espacement + contenu (identique pour la mesure et la vraie sheet).
  Widget _withChrome(Widget content) => Padding(
    padding: const EdgeInsets.all(10),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [const DragHintHeader(), const SizedBox(height: 12), content],
    ),
  );

  void _scheduleMeasure() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final box = _measureKey.currentContext?.findRenderObject() as RenderBox?;
      if (box == null || !box.hasSize) return;

      final height = box.size.height;
      if (_compactHeight == null || (height - _compactHeight!).abs() > 0.5) {
        setState(() => _compactHeight = height);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        _scheduleMeasure();

        final compactHeight = _compactHeight;
        return Stack(
          children: [
            // Mesure invisible du contenu compact
            Offstage(
              child: Align(
                alignment: Alignment.topCenter,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: kSheetMaxWidth),
                  child: RepaintBoundary(
                    key: _measureKey,
                    child: _withChrome(widget.compactContent),
                  ),
                ),
              ),
            ),
            // La vraie sheet, une fois la mesure connue
            if (compactHeight != null)
              Align(
                alignment: Alignment.bottomCenter,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: kSheetMaxWidth),
                  child: _buildSheet(
                    (compactHeight / constraints.maxHeight).clamp(
                      0.02,
                      widget.maxChildSize,
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }

  Widget _buildSheet(double minSize) {
    return DraggableScrollableSheet(
      key: ValueKey('$minSize/${widget.maxChildSize}'),
      initialChildSize: minSize,
      minChildSize: minSize,
      maxChildSize: widget.maxChildSize,
      expand: false,
      builder: (context, scrollController) {
        return Material(
          elevation: kSheetElevation,
          borderRadius: kSheetRadius,
          clipBehavior: Clip.antiAlias,
          child: NotificationListener<DraggableScrollableNotification>(
            onNotification: (n) {
              _isAtMin.set(n.extent <= n.minExtent + 0.01);
              return false;
            },
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(
                context,
              ).copyWith(scrollbars: false),
              child: SingleChildScrollView(
                controller: scrollController,
                physics: const AlwaysScrollableScrollPhysics(
                  parent: ClampingScrollPhysics(),
                ),
                child: _withChrome(
                  ClipRect(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (widget.header != null) widget.header!,
                        _SwitchedContent(
                          isAtMin: _isAtMin,
                          compact: widget.compactContent,
                          expanded: widget.expandedContent,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _SwitchedContent extends StatelessWidget {
  final ValueListenable<bool> isAtMin;
  final Widget compact;
  final Widget expanded;

  const _SwitchedContent({
    required this.isAtMin,
    required this.compact,
    required this.expanded,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isAtMin,
      builder: (context, atMin, _) => AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: atMin
            ? KeyedSubtree(key: const ValueKey('compact'), child: compact)
            : KeyedSubtree(key: const ValueKey('expanded'), child: expanded),
      ),
    );
  }
}
