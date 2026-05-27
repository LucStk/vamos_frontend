import "package:flutter/material.dart";
import 'package:vamos_cartographie/graphql/graphql.dart';
import 'package:vamos_cartographie/features/waypoints/domain/entities/entities.dart';

/// En-tête commune (icône colorée, label du type, numéro d'étape).
class WaypointHeader extends StatelessWidget {
  final GWaypointEnum type;

  const WaypointHeader({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(color: type.color, shape: BoxShape.circle),
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
                color: type.color,
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
