// Emplacement suggéré : lib/features/waypoint/widgets/waypoint_viewer_bottom_sheet.dart
import 'package:flutter/material.dart';
import 'package:trip_application/trip/domain/domain.dart';
import "/map/map.dart";

class DraggableBottomSheetShell extends StatefulWidget {
  final TripId tripId;

  /// Contenu compact : sert à mesurer la taille initiale de la sheet.
  final Widget compactContent;

  final Widget Function({
    bool isAtmin,
    required ScrollController scrollController,
  })
  builder;

  const DraggableBottomSheetShell({
    super.key,
    required this.tripId,
    required this.compactContent,
    required this.builder,
  });

  @override
  State<DraggableBottomSheetShell> createState() =>
      _DraggableBottomSheetState();
}

class _DraggableBottomSheetState extends State<DraggableBottomSheetShell> {
  static const double _maxWidth = 600;
  static const double _maxChildSize = 0.90;

  final GlobalKey _measureKey = GlobalKey();
  double? _compactHeight;
  bool _isAtMin = true;

  /// Même structure que dans la sheet : poignée + espacement + contenu.
  Widget _sheetBody(Widget content) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [const DragHintHeader(), const SizedBox(height: 12), content],
      ),
    );
  }

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

        final available = constraints.maxHeight;
        final compactHeight = _compactHeight;

        return Stack(
          children: [
            // 1. Mesure invisible du contenu compact
            Offstage(
              child: Align(
                alignment: Alignment.topCenter,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: _maxWidth),
                  child: RepaintBoundary(
                    key: _measureKey,
                    child: _sheetBody(widget.compactContent),
                  ),
                ),
              ),
            ),

            // 2. La vraie sheet, construite une fois la mesure connue
            if (compactHeight != null)
              Align(
                alignment: Alignment.bottomCenter,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: _maxWidth),
                  child: _buildSheet(
                    (compactHeight / available).clamp(0.02, _maxChildSize),
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
      // La clé recrée la sheet si la taille compacte change
      key: ValueKey(minSize),
      initialChildSize: minSize,
      minChildSize: minSize,
      maxChildSize: _maxChildSize,
      expand: false,
      builder: (context, scrollController) {
        return Material(
          elevation: 8,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          clipBehavior: Clip.antiAlias,
          child: NotificationListener<DraggableScrollableNotification>(
            onNotification: (notification) {
              final atMin =
                  notification.extent <= (notification.minExtent + 0.01);
              if (_isAtMin != atMin) setState(() => _isAtMin = atMin);
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
                child: _sheetBody(
                  ClipRect(
                    child: widget.builder(
                      isAtmin: _isAtMin,
                      scrollController: scrollController,
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
