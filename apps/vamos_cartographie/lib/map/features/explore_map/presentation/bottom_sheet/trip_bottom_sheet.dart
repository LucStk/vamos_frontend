import 'package:domain_core/failures/failures.dart';
import 'package:flutter/material.dart'; // Remplacé cupertino par material pour SizedBox et ListView standard
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip_application.dart';
import '/domain_features/domain_features.dart';
import '/map/overlay_ui/overlay_ui.dart';
import "bottom_sheet.dart";

import 'package:flutter/scheduler.dart';

class TripBottomSheet extends ConsumerStatefulWidget {
  final TripId tripId;
  const TripBottomSheet({super.key, required this.tripId});

  @override
  ConsumerState<TripBottomSheet> createState() => _TripBottomSheetState();
}

class _TripBottomSheetState extends ConsumerState<TripBottomSheet> {
  static const double _cardHeight = 64;
  static const double _cardMargin = 12;
  static const double _maxWidth = 600; // même largeur max que la sheet

  /// Position de la sheet, en fraction de la hauteur disponible.
  final ValueNotifier<double> _extent = ValueNotifier<double>(0);

  @override
  void dispose() {
    _extent.dispose();
    super.dispose();
  }

  void _updateExtent(double value) {
    if (_extent.value == value) return;
    // Évite un setState pendant le layout si la notification part à ce moment-là
    if (SchedulerBinding.instance.schedulerPhase ==
        SchedulerPhase.persistentCallbacks) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) _extent.value = value;
      });
    } else {
      _extent.value = value;
    }
  }

  @override
  Widget build(BuildContext context) {
    final trip = ref.watch(tripProvider(widget.tripId));
    if (trip == null) {
      throw NotFoundFailure(
        resourceId: widget.tripId.value,
        resourceType: "trip",
      );
    }
    final topInset = MediaQuery.paddingOf(context).top;
    final cardTop = topInset + _cardMargin;
    final cardBottom = cardTop + _cardHeight;

    return LayoutBuilder(
      builder: (context, constraints) {
        final available = constraints.maxHeight;

        // La sheet monte jusqu'à la barre d'état, pas plus haut.
        final maxChildSize = (1 - topInset / available)
            .clamp(0.5, 1.0)
            .toDouble();

        /// 0 = barre entièrement visible, 1 = barre entièrement absorbée.
        /// 0 = carte entièrement visible, 1 = carte entièrement absorbée.
        double progressOf(double extent) {
          final sheetTop = available * (1 - extent);
          return ((cardBottom - sheetTop) / _cardHeight)
              .clamp(0.0, 1.0)
              .toDouble();
        }

        return NotificationListener<DraggableScrollableNotification>(
          onNotification: (n) {
            _updateExtent(n.extent);
            return false;
          },
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Barre du haut : poussée et estompée par la sheet
              Positioned(
                top: cardTop,
                left: _cardMargin,
                right: _cardMargin,
                height: _cardHeight,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: _maxWidth - 2 * _cardMargin,
                    ),
                    child: ValueListenableBuilder<double>(
                      valueListenable: _extent,
                      child: Material(
                        elevation: 6,
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(16),
                        clipBehavior: Clip.antiAlias,
                        child: SizedBox(
                          height: _cardHeight,
                          child: TripInfoBar(trip: trip),
                        ),
                      ),
                      builder: (context, extent, child) {
                        final p = progressOf(extent);
                        return IgnorePointer(
                          ignoring: p >= 0.5,
                          child: Opacity(
                            opacity: 1 - p,
                            child: Transform.translate(
                              // La carte "s'enfonce" légèrement vers la sheet qui arrive
                              offset: Offset(0, -_cardMargin * p),
                              child: Transform.scale(
                                scale: 1 - 0.06 * p,
                                child: child,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),

              DraggableBottomSheetShell(
                tripId: widget.tripId,
                maxChildSize: maxChildSize,
                compactContent: TripCompactContent(trip: trip),
                builder: ({isAtmin = true, required scrollController}) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Zone où la barre est "absorbée"
                      ValueListenableBuilder<double>(
                        valueListenable: _extent,
                        builder: (context, extent, _) => _AbsorbedSlot(
                          progress: progressOf(extent),
                          child: TripInfoBar(trip: trip),
                        ),
                      ),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 200),
                        child: isAtmin
                            ? TripCompactContent(
                                key: const ValueKey('compact'),
                                trip: trip,
                              )
                            : TripViewerContent(
                                key: const ValueKey('expanded'),
                                trip: trip,
                              ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

/// Fait apparaître le contenu (hauteur + opacité) au fur et à mesure de [progress].
class _AbsorbedSlot extends StatelessWidget {
  final double progress;
  final Widget child;

  const _AbsorbedSlot({required this.progress, required this.child});

  @override
  Widget build(BuildContext context) {
    if (progress <= 0) return const SizedBox.shrink();
    return ClipRect(
      child: Align(
        alignment: Alignment.topCenter,
        heightFactor: progress,
        child: Opacity(opacity: progress, child: child),
      ),
    );
  }
}
