import 'package:flutter/material.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/trip/presentation/presentation.dart';

/// Type de mobilité : un bouton qui affiche le choix courant et ouvre un menu.
class MobilityTypeMenu extends StatelessWidget {
  const MobilityTypeMenu({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  final MobilityType selected;
  final ValueChanged<MobilityType> onChanged;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final current = selected.display;

    return MenuAnchor(
      style: MenuStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        padding: const WidgetStatePropertyAll(EdgeInsets.all(8)),
      ),
      menuChildren: [
        SizedBox(
          width: 180,
          child: Wrap(
            alignment: WrapAlignment.spaceEvenly,
            spacing: 4,
            runSpacing: 4,
            children: [
              for (final style in MobilityTypeStyle.values)
                SizedBox(
                  width: 48,
                  height: 48,
                  child: Builder(
                    builder: (context) {
                      final controller = MenuController.maybeOf(context);

                      return IconButton(
                        tooltip: style.label,
                        isSelected: style.type == selected,
                        onPressed: () {
                          onChanged(style.type);
                          controller?.close();
                        },
                        style: IconButton.styleFrom(
                          backgroundColor: style.type == selected
                              ? theme.colorScheme.secondaryContainer
                              : null,
                        ),
                        icon: Icon(style.icon, color: style.color),
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ],
      builder: (context, controller, child) {
        return SizedBox(
          width: 40,
          height: 40,
          child: InkWell(
            borderRadius: BorderRadius.circular(18),
            onTap: controller.isOpen ? controller.close : controller.open,
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(color: selected.display.color),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Icon(current.icon, color: current.color, size: 20),
              ),
            ),
          ),
        );
      },
    );
  }
}
