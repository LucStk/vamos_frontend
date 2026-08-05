// features/map/presentation/screens/map_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/injection/map_hit_notifier.dart';
import 'package:vamos_cartographie/map/map_engine/map_hit_engine_widget.dart';
import 'map_bottom_sheet.dart';
import '/map/rendering/rendering.dart';
import '/map/presentation/widgets/widgets.dart';

class MapScreen extends StatelessWidget {
  final Id<Trip> tripId;
  final bool isOwner;
  const MapScreen({super.key, required this.tripId, this.isOwner = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          MapElementEngineWidget(
            tripId: tripId,
            child: Consumer(
              builder: (context, ref, child) {
                final mapController = ref.watch(mapControllerProvider);
                final shouldPanMapNotifier = ref.watch(shouldPanMapProvider);

                return ValueListenableBuilder<bool>(
                  valueListenable: shouldPanMapNotifier,
                  builder: (context, shouldPanMap, _) {
                    print("FlutterMap rebuild");
                    return FlutterMap(
                      mapController: mapController,
                      options: MapOptions(
                        initialCenter: const LatLng(46.8, 2.2),
                        initialZoom: 7,
                        interactionOptions: InteractionOptions(
                          flags: shouldPanMap
                              ? InteractiveFlag.all &
                                    ~InteractiveFlag.doubleTapZoom
                              : InteractiveFlag.all &
                                    ~InteractiveFlag.doubleTapZoom &
                                    ~InteractiveFlag.drag,
                        ),
                      ),
                      children: [
                        MapTileLayer(),
                        SegmentLayer(tripId: tripId),
                        CursorLayer(tripId: tripId),
                        VertexLayer(tripId: tripId),
                        SketchLayer(tripId: tripId),
                        MapControls(),
                      ],
                    );
                  },
                );
              },
            ),
          ),
          MapTopBar(tripId: tripId),
          MapBottomSheet(tripId: tripId),
        ],
      ),
    );
  }
}
