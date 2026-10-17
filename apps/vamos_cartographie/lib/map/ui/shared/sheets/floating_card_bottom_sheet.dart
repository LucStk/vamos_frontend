import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:vamos_cartographie/map/ui/modes/trip_mode/header/floating_trip_card.dart';
import 'package:vamos_cartographie/map/ui/shared/sheets/draggable_sheet.dart';

const kFloatingCardHeight = 64.0;

/// Marge entre la carte et les bords / la barre d'état.
const kFloatingCardMargin = 12.0;

class FloatingCardBottomSheet extends StatefulWidget {
  const FloatingCardBottomSheet({
    super.key,
    required this.cardBuilder,
    required this.header,
    required this.compactContent,
    required this.expandedContent,
  });

  /// [progress] vaut 0 quand la carte est entièrement visible,
  /// 1 quand elle est entièrement absorbée.
  final Widget Function(BuildContext context, ValueListenable<double> progress)
  cardBuilder;

  final Widget header;
  final Widget compactContent;
  final Widget expandedContent;

  @override
  State<FloatingCardBottomSheet> createState() =>
      _FloatingCardBottomSheetState();
}

class _FloatingCardBottomSheetState extends State<FloatingCardBottomSheet> {
  /// 0 = carte entièrement visible, 1 = carte entièrement absorbée.
  final _progress = DeferredNotifier<double>(0);

  @override
  void dispose() {
    _progress.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final topInset = MediaQuery.paddingOf(context).top;

    return LayoutBuilder(
      builder: (context, constraints) {
        final geometry = _TopCardGeometry(
          topInset: topInset,
          availableHeight: constraints.maxHeight,
        );

        return NotificationListener<DraggableScrollableNotification>(
          onNotification: (n) {
            _progress.set(geometry.progressFor(n.extent));
            return false;
          },
          child: Stack(
            fit: StackFit.expand,
            children: [
              _TopCardSlot(
                top: geometry.top,
                child: widget.cardBuilder(context, _progress),
              ),
              DraggableBottomSheetShell(
                maxChildSize: geometry.maxChildSize,
                header: AbsorbedSlot(progress: _progress, child: widget.header),
                compactContent: widget.compactContent,
                expandedContent: widget.expandedContent,
              ),
            ],
          ),
        );
      },
    );
  }
}

// ---------------------------------------------------------------------------
// Logique pure
// ---------------------------------------------------------------------------

/// Calculs de position de la carte flottante par rapport à la sheet.
@immutable
class _TopCardGeometry {
  const _TopCardGeometry({
    required this.topInset,
    required this.availableHeight,
  });

  final double topInset;
  final double availableHeight;

  double get top => topInset + kFloatingCardMargin;
  double get bottom => top + kFloatingCardHeight;

  /// La sheet monte jusqu'à la barre d'état, pas plus haut.
  double get maxChildSize =>
      (1 - topInset / availableHeight).clamp(0.5, 1.0).toDouble();

  /// 0 = carte entièrement visible, 1 = carte entièrement absorbée.
  double progressFor(double extent) {
    final sheetTop = availableHeight * (1 - extent);
    return ((bottom - sheetTop) / kFloatingCardHeight)
        .clamp(0.0, 1.0)
        .toDouble();
  }
}

// ---------------------------------------------------------------------------
// Widgets
// ---------------------------------------------------------------------------

/// Positionne la carte en haut de l'écran, centrée et limitée en largeur.
/// Doit rester enfant direct du [Stack] (c'est un [Positioned]).
class _TopCardSlot extends StatelessWidget {
  const _TopCardSlot({required this.top, required this.child});

  final double top;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: kFloatingCardMargin,
      right: kFloatingCardMargin,
      child: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: kSheetMaxWidth - 2 * kFloatingCardMargin,
          ),
          child: child,
        ),
      ),
    );
  }
}
