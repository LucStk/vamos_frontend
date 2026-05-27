import "package:flutter/material.dart";
import "package:vamos_cartographie/graphql/graphql.dart";
import "package:vamos_cartographie/features/waypoints/domain/entities/entities.dart";

class WaypointTypeCard extends StatelessWidget {
  final GWaypointEnum type;
  final bool isSelected;
  final VoidCallback onTap;

  const WaypointTypeCard({
    super.key,
    required this.type,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 72,
        padding: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? type.color.withOpacity(0.15) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? type.color : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          mainAxisSize:
              MainAxisSize.min, // Évite que la colonne prenne trop de hauteur
          children: [
            Icon(type.icon, color: type.color, size: 24),
            const SizedBox(height: 4),
            Text(
              type.label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10,
                color: isSelected ? type.color : Colors.black87,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
