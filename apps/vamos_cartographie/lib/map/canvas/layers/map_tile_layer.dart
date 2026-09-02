import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';

class MapTileLayer extends StatelessWidget {
  const MapTileLayer({super.key});
  @override
  Widget build(BuildContext context) {
    debugPrint("Maptitle Layer Rebuild");
    return TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'com.example.vamos_cartographie',
    );
  }
}
