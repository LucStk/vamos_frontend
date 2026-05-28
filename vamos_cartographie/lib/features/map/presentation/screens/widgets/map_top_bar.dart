import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/features/map/presentation/providers/map_notifier.dart';

/// Barre supérieure de la MapPage.
/// Contient : bouton retour, titre cliquable, point dirty.
class MapTopBar extends ConsumerWidget {
  const MapTopBar({super.key});

  void _onBack(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final tripId = ref.watch(currentTripIdProvider);
    final mapState = ref.watch(mapStateProvider(tripId));
    final title = mapState.currentTrip.title;

    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: SafeArea(
        child: Container(
          margin: const EdgeInsets.fromLTRB(8, 8, 8, 0),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface.withOpacity(0.95),
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.10),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              // ── Bouton retour ──
              IconButton(
                icon: const Icon(Icons.arrow_back),
                tooltip: 'Retour aux voyages',
                onPressed: () => _onBack(context),
              ),

              // ── Titre (cliquable) ──
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        title.isNotEmpty ? title : 'Nouveau voyage',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                          color: title.isNotEmpty
                              ? theme.colorScheme.onSurface
                              : theme.colorScheme.onSurface.withOpacity(0.4),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
