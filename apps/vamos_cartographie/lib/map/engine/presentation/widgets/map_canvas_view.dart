import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'map_gesture_bridge.dart';

class MapCanvas extends StatelessWidget {
  final MapController mapController;
  final Widget mapScenePaint;
  final List<Widget> layers;

  const MapCanvas({
    super.key,
    required this.mapController,
    required this.mapScenePaint,
    this.layers = const [],
  });

  @override
  Widget build(BuildContext context) {
    final panAllowed = PanLock.of(context);
    return ValueListenableBuilder<bool>(
      valueListenable: panAllowed,
      builder: (context, panAllowed, _) {
        return FlutterMap(
          mapController: mapController,
          options: MapOptions(
            initialCenter: const LatLng(46.8, 2.2),
            initialZoom: 7,
            interactionOptions: InteractionOptions(
              flags: panAllowed
                  ? InteractiveFlag.all & ~InteractiveFlag.doubleTapZoom
                  : InteractiveFlag.all &
                        ~InteractiveFlag.doubleTapZoom &
                        ~InteractiveFlag.drag,
            ),
          ),
          children: [...layers, mapScenePaint],
        );
      },
    );
  }
}
