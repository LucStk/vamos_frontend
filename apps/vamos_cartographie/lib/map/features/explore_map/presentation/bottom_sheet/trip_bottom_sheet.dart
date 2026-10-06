import 'package:domain_core/failures/failures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip_application.dart';
import '../../../../overlay_ui/draggable_sheet/deferred_notifier.dart';
import '../../../../overlay_ui/draggable_sheet/draggable_bottom_sheet_shell.dart';
import '../../../../overlay_ui/draggable_sheet/draggable_sheet.dart';
import '/domain_features/domain_features.dart';
import 'bottom_sheet.dart';
import 'floating_trip_card.dart';

const _cardHeight = 64.0;
const _cardMargin = 12.0;

class TripBottomSheet extends ConsumerStatefulWidget {
  final TripId tripId;
  const TripBottomSheet({super.key, required this.tripId});

  @override
  ConsumerState<TripBottomSheet> createState() => _TripBottomSheetState();
}

class _TripBottomSheetState extends ConsumerState<TripBottomSheet> {
  /// 0 = carte entièrement visible, 1 = carte entièrement absorbée.
  final _progress = DeferredNotifier<double>(0);

  @override
  void dispose() {
    _progress.dispose();
    super.dispose();
  }

  Trip _watchTrip() {
    final trip = ref.watch(tripProvider(widget.tripId));
    if (trip == null) {
      throw NotFoundFailure(
        resourceId: widget.tripId.value,
        resourceType: 'trip',
      );
    }
    return trip;
  }

  @override
  Widget build(BuildContext context) {
    final trip = _watchTrip();
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
                child: FloatingTripCard(trip: trip, progress: _progress),
              ),
              DraggableBottomSheetShell(
                maxChildSize: geometry.maxChildSize,
                header: AbsorbedSlot(
                  progress: _progress,
                  child: TripInfoBar(trip: trip),
                ),
                compactContent: TripCompactContent(trip: trip),
                expandedContent: TripViewerContent(trip: trip),
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

  double get top => topInset + _cardMargin;
  double get bottom => top + _cardHeight;

  /// La sheet monte jusqu'à la barre d'état, pas plus haut.
  double get maxChildSize =>
      (1 - topInset / availableHeight).clamp(0.5, 1.0).toDouble();

  /// 0 = carte entièrement visible, 1 = carte entièrement absorbée.
  double progressFor(double extent) {
    final sheetTop = availableHeight * (1 - extent);
    return ((bottom - sheetTop) / _cardHeight).clamp(0.0, 1.0).toDouble();
  }
}

// ---------------------------------------------------------------------------
// Widgets
// ---------------------------------------------------------------------------

/// Positionne la carte en haut de l'écran, centrée et limitée en largeur.
/// Doit rester enfant direct du [Stack] (c'est un [Positioned]).
class _TopCardSlot extends StatelessWidget {
  final double top;
  final Widget child;

  const _TopCardSlot({required this.top, required this.child});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: _cardMargin,
      right: _cardMargin,
      // height: _cardHeight,  <- supprimé
      child: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: kSheetMaxWidth - 2 * _cardMargin,
          ),
          child: child,
        ),
      ),
    );
  }
}
