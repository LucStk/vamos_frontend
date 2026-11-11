import 'package:flutter/material.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/modes/route_edit/ui/widgets/mobility_type_menu.dart';

/// Panneau d'actions du mode sketch.
///
/// Ligne 1 : retour, type de mobilité, effacer le tracé.
/// Ligne 2 : routage et validation.
class CreateWaypointActions extends StatelessWidget {
  const CreateWaypointActions({
    super.key,
    required this.mobilityType,
    required this.onMobilityTypeChanged,
    required this.goBack,
    required this.eraseSketch,
    required this.validateSketch,
    required this.routingSketch,
    required this.isSketchRouted,
    required this.routingFailed,
  });

  final MobilityType mobilityType;
  final ValueChanged<MobilityType> onMobilityTypeChanged;
  final VoidCallback goBack;
  final VoidCallback eraseSketch;
  final VoidCallback validateSketch;
  final VoidCallback routingSketch;
  final bool isSketchRouted;
  final bool routingFailed;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Align(
      alignment: Alignment.bottomCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 560),
        child: Material(
          color: colors.surface,
          surfaceTintColor: colors.surfaceTint,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          clipBehavior: Clip.antiAlias,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Ligne 1 : outils
                Row(
                  children: [
                    IconButton(
                      tooltip: 'Retour',
                      onPressed: goBack,
                      icon: const Icon(Icons.arrow_back),
                    ),
                    const SizedBox(width: 4),
                    MobilityTypeMenu(
                      selected: mobilityType,
                      onChanged: onMobilityTypeChanged,
                    ),
                    const Spacer(),
                    IconButton(
                      tooltip: 'Effacer le tracé',
                      onPressed: eraseSketch,
                      color: colors.error,
                      icon: const Icon(Icons.backspace_outlined),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // Ligne 2 : actions principales
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: FilledButton.tonalIcon(
                        onPressed: routingSketch,
                        style: routingFailed
                            ? FilledButton.styleFrom(
                                backgroundColor: colors.errorContainer,
                                foregroundColor: colors.onErrorContainer,
                              )
                            : null,
                        icon: Icon(
                          routingFailed ? Icons.refresh : Icons.alt_route,
                        ),
                        label: Text(
                          routingFailed ? 'Réessayer' : 'Router',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      flex: 3,
                      child: FilledButton.icon(
                        onPressed: validateSketch,
                        icon: const Icon(Icons.check),
                        label: Text(
                          isSketchRouted ? 'Valider' : 'Valider à main levée',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
