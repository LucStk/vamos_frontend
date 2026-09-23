import "package:flutter/material.dart";
import "map_item_style.dart";

class TypeSelector<T extends MapItemStyle> extends StatelessWidget {
  final List<T> values;
  final T selectedType;
  final ValueChanged<T> onTypeChanged;

  const TypeSelector({
    super.key,
    required this.values,
    required this.selectedType,
    required this.onTypeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: values.map((type) {
          final isSelected = selectedType == type;
          final typeColor = Color(type.colorValue);

          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => onTypeChanged(type),
                borderRadius: BorderRadius.circular(12),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    // Fond légèrement teinté quand sélectionné pour garder une super lisibilité
                    color: isSelected
                        ? typeColor.withValues(alpha: 0.12)
                        : Theme.of(context).colorScheme.surfaceContainerHighest
                              .withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isSelected ? typeColor : Colors.transparent,
                      width: 1.5,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        type.icon,
                        color: isSelected ? typeColor : Colors.grey.shade600,
                        size: 20,
                      ),
                      const SizedBox(width: 6),
                      Text(
                        type.label,
                        style: TextStyle(
                          fontSize: 12,
                          color: isSelected ? typeColor : Colors.grey.shade800,
                          fontWeight: isSelected
                              ? FontWeight.w600
                              : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
