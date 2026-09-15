import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/map_canvas/layers/map_tile_layer.dart';
import 'package:vamos_cartographie/map_canvas/layers/network_overlay_layer.dart';
import 'package:vamos_cartographie/map_canvas/overlay_ui/right_control_panel.dart';

class MapCanvas extends StatelessWidget {
  final MapController mapController;
  final ValueListenable<bool> panAllowed;
  final CustomPainter painter;

  const MapCanvas({
    super.key,
    required this.mapController,
    required this.panAllowed,
    required this.painter,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: panAllowed,
      builder: (context, panAllowed, _) => FlutterMap(
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
        children: [
          const MapTileLayer(),
          const NetworkOverlayLayer(),
          const MapControls(),
          CustomPaint(painter: painter),
        ], // référence stable, capturée par la closure
      ),
    );
  }
}
