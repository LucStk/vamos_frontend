import 'package:flutter_map/flutter_map.dart';

TileLayer buildMapTileLayer() {
  return TileLayer(
    urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
    userAgentPackageName: 'com.example.vamos_cartographie',
  );
}
