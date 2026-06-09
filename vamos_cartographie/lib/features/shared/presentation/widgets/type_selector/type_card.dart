import "package:flutter/material.dart";
import "package:vamos_cartographie/features/shared/domain/types/map_item_type.dart";

class TypeCard extends StatelessWidget {
  final MapItemType type;
  final bool isSelected;
  final VoidCallback onTap;

  const TypeCard({
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
