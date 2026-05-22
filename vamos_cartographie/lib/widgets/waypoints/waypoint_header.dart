import "package:flutter/material.dart";

import 'package:api_client/api_client.dart';
import 'package:vamos_cartographie/domain/domain.dart';

/// En-tête commune (icône colorée, label du type, numéro d'étape).
class WaypointHeader extends StatelessWidget {
  final GWaypointTypeEnum type;
  final int index;

  const WaypointHeader({required this.type, required this.index});

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
            Text(
              'Étape ${index + 1}',
              style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
            ),
          ],
        ),
      ],
    );
  }
}
