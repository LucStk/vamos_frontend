import "package:flutter/material.dart";
import "package:vamos_cartographie/waypoint/presentation/presentation.dart";

/// En-tête commune (icône colorée, label du type, numéro d'étape).
class WaypointHeader extends StatelessWidget {
  final PoiCategoryStyle type;

  const WaypointHeader({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: Color(type.colorValue),
            shape: BoxShape.circle,
          ),
          child: Icon(type.icon, color: Colors.white, size: 17),
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
          ],
        ),
      ],
    );
  }
}
