import "package:flutter/material.dart";
import "package:api_client/api_client.dart";
import "package:vamos_cartographie/domain/domain.dart";

class WaypointTypeSelector extends StatelessWidget {
  final ValueChanged<GWaypointEnum> onTypeChanged;

  final GWaypointEnum selectedType;
  const WaypointTypeSelector({
    super.key,
    required this.selectedType,
    required this.onTypeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        alignment: WrapAlignment.center,
        children: GWaypointEnum.values.map((type) {
          final selected = selectedType == type;
          return GestureDetector(
            onTap: () => onTypeChanged(type),
            child: Container(
              width: 72,
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: selected
                    ? type.color.withOpacity(0.15)
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: selected ? type.color : Colors.grey.shade300,
                  width: selected ? 2 : 1,
                ),
              ),
              child: Column(
                children: [
                  Icon(type.icon, color: type.color, size: 24),
                  const SizedBox(height: 4),
                  Text(
                    type.label,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 10,
                      color: selected ? type.color : Colors.black87,
                      fontWeight: selected
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
