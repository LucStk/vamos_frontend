import "package:flutter/material.dart";
import "package:vamos_cartographie/shared_ui/map_item_style.dart";

class TypeCard extends StatelessWidget {
  final MapItemStyle type;
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
          color: isSelected ? Color(type.colorValue) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? Color(type.colorValue) : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          mainAxisSize:
              MainAxisSize.min, // Évite que la colonne prenne trop de hauteur
          children: [
            Icon(type.icon, color: Color(type.colorValue), size: 24),
            const SizedBox(height: 4),
            Text(
              type.label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10,
                color: isSelected ? Color(type.colorValue) : Colors.black87,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
