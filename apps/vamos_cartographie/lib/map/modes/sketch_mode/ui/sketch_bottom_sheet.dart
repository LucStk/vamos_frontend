import 'package:flutter/material.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/trip/presentation/mobility_type_display.dart';

/// Panneau d'actions ancré en bas de la carte pendant le dessin d'un tracé.
///
/// Un callback `null` désactive le bouton correspondant (par exemple
/// « Effacer tracé » tant qu'aucun tracé n'est en cours).
///
/// Ce n'est volontairement pas un `showModalBottomSheet` : une feuille modale
/// bloquerait la carte, or on doit pouvoir continuer à dessiner dessus.
class SketchBottomSheet extends StatelessWidget {
  const SketchBottomSheet({
    super.key,
    required this.onBack,
    required this.onValidate,
    required this.mobilityType,
    required this.onMobilityTypeChanged,
    this.onRoute,
    this.onCancelStroke,
    this.onClearRoute,
  });

  /// Quitte le mode sans valider.
  final VoidCallback onBack;

  /// Valide le tracé.
  final VoidCallback? onValidate;

  /// Type de mobilité sélectionné (utilisé par le routage et la validation).
  final MobilityType mobilityType;
  final ValueChanged<MobilityType> onMobilityTypeChanged;

  /// Lance le routage du tracé (calcul de l'itinéraire).
  final VoidCallback? onRoute;

  /// Efface le tracé en cours, sans quitter le mode.
  final VoidCallback? onCancelStroke;

  /// Efface toute la route. Une confirmation est demandée avant l'appel.
  final VoidCallback? onClearRoute;

  Future<void> _confirmClearRoute(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        final colors = Theme.of(dialogContext).colorScheme;
        return AlertDialog(
          icon: Icon(Icons.delete_forever_outlined, color: colors.error),
          title: const Text('Effacer toute la route ?'),
          content: const Text(
            'Le tracé et la route calculée seront supprimés.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(false),
              child: const Text('Annuler'),
            ),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: colors.error,
                foregroundColor: colors.onError,
              ),
              onPressed: () => Navigator.of(dialogContext).pop(true),
              child: const Text('Tout effacer'),
            ),
          ],
        );
      },
    );

    if (confirmed == true && context.mounted) {
      onClearRoute?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Align(
      alignment: Alignment.bottomCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 560),
        child: Material(
          elevation: 8,
          color: colors.surface,
          surfaceTintColor: colors.surfaceTint,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          clipBehavior: Clip.antiAlias,
          child: SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _MobilityTypeSelector(
                    selected: mobilityType,
                    onChanged: onMobilityTypeChanged,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: _SheetAction(
                          icon: Icons.arrow_back,
                          label: 'Retour',
                          onPressed: onBack,
                        ),
                      ),
                      Expanded(
                        child: _SheetAction(
                          icon: Icons.alt_route,
                          label: 'Router',
                          onPressed: onRoute,
                        ),
                      ),
                      Expanded(
                        child: _SheetAction(
                          icon: Icons.backspace_outlined,
                          label: 'Effacer tracé',
                          onPressed: onCancelStroke,
                        ),
                      ),
                      Expanded(
                        child: _SheetAction(
                          icon: Icons.delete_forever_outlined,
                          label: 'Tout effacer',
                          destructive: true,
                          onPressed: onClearRoute == null
                              ? null
                              : () => _confirmClearRoute(context),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  FilledButton.icon(
                    onPressed: onValidate,
                    icon: const Icon(Icons.check),
                    label: const Text('Valider'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SheetAction extends StatelessWidget {
  const _SheetAction({
    required this.icon,
    required this.label,
    required this.onPressed,
    this.destructive = false,
  });

  final IconData icon;
  final String label;
  final VoidCallback? onPressed;
  final bool destructive;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final color = onPressed == null
        ? theme.disabledColor
        : destructive
        ? colors.error
        : colors.onSurface;

    return Semantics(
      button: true,
      enabled: onPressed != null,
      label: label,
      excludeSemantics: true,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: color),
              const SizedBox(height: 2),
              Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: theme.textTheme.labelSmall?.copyWith(color: color),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MobilityTypeSelector extends StatelessWidget {
  const _MobilityTypeSelector({
    required this.selected,
    required this.onChanged,
  });

  final MobilityType selected;
  final ValueChanged<MobilityType> onChanged;

  @override
  Widget build(BuildContext context) {
    // Icônes seules : 5 types avec libellé ne tiendraient pas sur un écran
    // étroit. Le libellé reste accessible via le tooltip / la sémantique.
    return SegmentedButton<MobilityType>(
      showSelectedIcon: false,
      style: const ButtonStyle(visualDensity: VisualDensity.compact),
      segments: [
        for (final style in MobilityTypeStyle.values)
          ButtonSegment(
            value: style.type,
            icon: Icon(style.icon),
            tooltip: style.label,
          ),
      ],
      selected: {selected},
      onSelectionChanged: (selection) => onChanged(selection.first),
    );
  }
}
