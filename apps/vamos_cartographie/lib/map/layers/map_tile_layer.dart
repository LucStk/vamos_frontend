import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:vamos_cartographie/core/network/network.dart';

class MapTileLayer extends StatelessWidget {
  const MapTileLayer({super.key});
  @override
  Widget build(BuildContext context) {
    debugPrint("Maptitle Layer Rebuild");
    final maptilerKey = MaptilerConfig.url;
    if (maptilerKey != null) {
      debugPrint("MapTiler key found: ${maptilerKey.isNotEmpty}");

      return TileLayer(
        urlTemplate:
            'https://api.maptiler.com/maps/landscape-v4/{z}/{x}/{y}.png'
            '?key=$maptilerKey',
        userAgentPackageName: 'com.example.vamos_cartographie',
      );
    } else {
      return TileLayer(
        urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
        userAgentPackageName: 'com.example.vamos_cartographie',
      );
    }
  }
}
