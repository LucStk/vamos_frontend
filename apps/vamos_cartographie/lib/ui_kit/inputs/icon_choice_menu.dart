import 'package:material_ui/material_ui.dart';

class IconChoiceOption<T> {
  const IconChoiceOption({
    required this.value,
    required this.icon,
    required this.label,
    this.color,
  });

  final T value;
  final IconData icon;
  final String label;
  final Color? color;
}

/// Un bouton qui affiche le choix courant et ouvre une grille d'icônes.
class IconChoiceMenu<T> extends StatelessWidget {
  const IconChoiceMenu({
    super.key,
    required this.options,
    required this.selected,
    required this.onChanged,
    this.columns = 3,
    this.buttonSize = 40,
  }) : assert(options.length > 0);

  final List<IconChoiceOption<T>> options;
  final T selected;
  final ValueChanged<T> onChanged;
  final int columns;
  final double buttonSize;

  static const _cell = 48.0;
  static const _gap = 4.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final current = options.firstWhere(
      (o) => o.value == selected,
      orElse: () => options.first,
    );
    final menuWidth = columns * _cell + (columns - 1) * _gap;

    return MenuAnchor(
      style: MenuStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        padding: const WidgetStatePropertyAll(EdgeInsets.all(8)),
      ),
      menuChildren: [
        SizedBox(
          width: menuWidth,
          child: Wrap(
            spacing: _gap,
            runSpacing: _gap,
            children: [
              for (final option in options)
                SizedBox(
                  width: _cell,
                  height: _cell,
                  // Builder : MenuController.maybeOf a besoin d'un context
                  // situé sous le MenuAnchor.
                  child: Builder(
                    builder: (context) => IconButton(
                      tooltip: option.label,
                      isSelected: option.value == selected,
                      onPressed: () {
                        onChanged(option.value);
                        MenuController.maybeOf(context)?.close();
                      },
                      style: IconButton.styleFrom(
                        backgroundColor: option.value == selected
                            ? theme.colorScheme.secondaryContainer
                            : null,
                      ),
                      icon: Icon(option.icon, color: option.color),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
      builder: (context, controller, _) {
        final color = current.color ?? theme.colorScheme.outline;
        return SizedBox(
          width: buttonSize,
          height: buttonSize,
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: controller.isOpen ? controller.close : controller.open,
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(color: color),
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
