import "package:flutter/material.dart";
import "package:vamos_cartographie/domain_features/waypoint/presentation/waypoint_kind_display.dart";

/// En-tête commune (icône colorée, label du type, numéro d'étape).
class WaypointHeader extends StatelessWidget {
  final WaypointKindStyle kind;

  const WaypointHeader({super.key, required this.kind});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: Color(kind.colorValue),
            shape: BoxShape.circle,
          ),
          child: Icon(kind.icon, color: Colors.white, size: 17),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              kind.label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(kind.colorValue),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
