import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:flutter_map_dragmarker/flutter_map_dragmarker.dart";
import 'package:domain_core/domain_core.dart';
import 'package:map_application/application/map_state.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/rendering/elements/pencil_element.dart';
import 'package:vamos_cartographie/topology/injection/queries/queries.dart';
import '/map/map.dart';
import "/map/rendering/adapters/adapters.dart";

class SketchLayer extends ConsumerWidget {
  final Id<Trip> tripId;
  const SketchLayer({super.key, required this.tripId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mapStateNotifier = ref.read(mapStateProvider(tripId).notifier);
    final mapState = ref.watch(mapStateProvider(tripId));
    switch (mapState.mode) {
      case SketchMode e:
        final vertex = ref.read(vertexUiElementProvider(tripId, e.vertexStart));
        return DragMarkers(
          markers: [
            toDragMarker(
              PencilElement(tripId, vertex.latLng),
              tripId,
              mapStateNotifier,
            ),
          ],
        );
      case _:
        return SizedBox.shrink();
    }
  }
}
