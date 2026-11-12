import 'package:flutter/material.dart';

/// Panneau d'actions du mode sketch.
///
/// Ligne 1 : retour, type de mobilité, effacer le tracé.
/// Ligne 2 : routage et validation.
class CreateWaypointActions extends StatelessWidget {
  const CreateWaypointActions({super.key, required this.validatePosition});

  final VoidCallback validatePosition;

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
                Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      minWidth: 200,
                      maxWidth: 280,
                    ),
                    child: FilledButton.icon(
                      onPressed: validatePosition,
                      icon: const Icon(Icons.check),
                      label: const Text(
                        'Valider',
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
