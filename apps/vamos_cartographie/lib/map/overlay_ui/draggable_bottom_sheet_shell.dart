// Emplacement suggéré : lib/features/waypoint/widgets/waypoint_viewer_bottom_sheet.dart
import 'package:flutter/material.dart';
import 'package:trip_application/trip/domain/domain.dart';

// On passe en StatefulConsumerWidget pour pouvoir stocker l'état "isAtMin"
class DraggableBottomSheetShell extends StatefulWidget {
  final TripId tripId;
  final Widget Function({
    bool isAtmin,
    required ScrollController scrollController,
  })
  builder;

  const DraggableBottomSheetShell({
    super.key,
    required this.tripId,
    required this.builder,
  });

  @override
  State<DraggableBottomSheetShell> createState() =>
      _DraggableBottomSheetState();
}

class _DraggableBottomSheetState extends State<DraggableBottomSheetShell> {
  // On initialise l'état à true car initialChildSize == minChildSize (0.10)
  bool _isAtMin = true;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600),
        child: DraggableScrollableSheet(
          initialChildSize: 0.10,
          minChildSize: 0.10,
          maxChildSize: 0.90,
          expand: false,
          builder: (context, scrollController) {
            return Material(
              elevation: 8,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              clipBehavior: Clip.antiAlias,
              child: NotificationListener<DraggableScrollableNotification>(
                onNotification: (notification) {
                  final atMin =
                      notification.extent <= (notification.minExtent + 0.01);

                  // On met à jour l'état seulement si la valeur change pour éviter des rebuilds inutiles
                  if (_isAtMin != atMin) {
                    setState(() {
                      _isAtMin = atMin;
                    });
                  }
                  return false; // Changé à false pour permettre à la notification de continuer à se propager si besoin
                },
                // Condition pour intervertir WidgetA et WidgetB
                child: Builder(
                  builder: (context) => widget.builder(
                    isAtmin: _isAtMin,
                    scrollController: scrollController,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
