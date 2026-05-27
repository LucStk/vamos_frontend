import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import "widget/context_menu_card.dart";
import "models/map_context_action.dart";

class MapContextMenu extends StatelessWidget {
  /// Position géographique où le menu est ancré.
  final LatLng position;

  /// Liste des options à afficher dans le menu.
  final List<MapContextAction> options;

  /// Callback appelé lorsque l'utilisateur ferme le menu (bouton ✕).
  final VoidCallback onClose;

  const MapContextMenu({
    super.key,
    required this.position,
    required this.options,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    // On utilise un MarkerLayer flutter_map : le widget sera automatiquement
    // repositionné en pixels à chaque frame en fonction de la position
    // géographique → le menu "colle" à la carte même pendant le drag.
    return MarkerLayer(
      markers: [
        Marker(
          point: position,
          width: 200,
          // Hauteur dynamique : 44 px par option + 40 px header
          height: 40.0 + options.length * 44.0,
          // Ancrage : le bas-centre du widget pointe sur le coordonnée
          alignment: Alignment.bottomCenter,
          child: MenuCard(
            position: position,
            options: options,
            onClose: onClose,
          ),
        ),
      ],
    );
  }
}
