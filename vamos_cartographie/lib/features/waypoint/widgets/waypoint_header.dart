import "package:flutter/material.dart";
import "package:vamos_cartographie/features/waypoint/domain/poi_ui.dart";

/// En-tête commune (icône colorée, label du type, numéro d'étape).
class WaypointHeader extends StatelessWidget {
  final PoiCategoryUi type;

  const WaypointHeader({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: Color(type.colorValue),
            shape: BoxShape.circle,
          ),
          child: Icon(type.icon, color: Colors.white, size: 20),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              type.label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(type.colorValue),
              ),
            ),
            // TODO : Afficher le numéro de l'étape
            // Text(
            //   'Étape ,
            //   style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
            // ),
          ],
        ),
      ],
    );
  }
}
