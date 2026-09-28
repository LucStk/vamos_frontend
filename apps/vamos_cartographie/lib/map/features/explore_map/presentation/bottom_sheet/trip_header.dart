import "package:flutter/material.dart";

/// En-tête commune (icône colorée, label du type, numéro d'étape).
class TripHeader extends StatelessWidget {
  final String title;
  const TripHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            // color: Color(type.colorValue),
          ),
        ),
      ],
    );
  }
}
