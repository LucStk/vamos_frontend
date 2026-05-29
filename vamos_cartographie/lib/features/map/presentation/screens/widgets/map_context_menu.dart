import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import "context_menu_card.dart";

class MapContextMenu extends StatelessWidget {
  final VoidCallback onClose;
  final LatLng position;

  const MapContextMenu({
    super.key,
    required this.position,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return MarkerLayer(
      markers: [
        Marker(
          point: position,
          width: 200,
          height: 40.0 + 2 * 44.0,
          alignment: Alignment.bottomCenter,
          child: MenuCard(onClose: onClose),
        ),
      ],
    );
  }
}
