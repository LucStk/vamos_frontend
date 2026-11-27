import 'package:domain_core/domain_core.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/route/injection/proposal_elevation_provider.dart';
import 'package:vamos_cartographie/domain_features/trip/presentation/mobility_type_display.dart';
import 'package:vamos_cartographie/map/entities/common/elevation_chart.dart';

/// Profil d'élévation de l'itinéraire proposé, en bas du panneau de l'outil
/// « Tracer ». Rien à la voiture ni au bus : seules la marche et le vélo ont
/// une élévation.
class SketchElevation extends ConsumerWidget {
  const SketchElevation({
    super.key,
    required this.tripId,
    required this.proposalId,
    required this.mobility,
  });

  final TripId tripId;
  final Id proposalId;
  final MobilityType mobility;

  static const _chartHeight = 100.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!insightsMobilities.contains(mobility)) return const SizedBox.shrink();

    final theme = Theme.of(context);
    final elevation = ref.watch(
      proposalElevationProvider((tripId: tripId, proposalId: proposalId)),
    );

    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: elevation.when(
        // La hauteur est réservée : le panneau ne saute pas à l'arrivée.
        loading: () => const SizedBox(
          height: _chartHeight,
          child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
        ),
        error: (e, _) => _note(
          theme,
          e is Failure
              ? 'Dénivelé indisponible : ${e.message}'
              : 'Dénivelé indisponible.',
        ),
        data: (profile) {
          // Le serveur n'a pas de profil pour ce tracé (service d'altitude sans
          // données, par exemple) : on le dit, plutôt que de laisser un vide
          // qu'on ne sait pas expliquer.
          if (profile == null || !profile.isDrawable) {
            return _note(theme, 'Dénivelé indisponible pour ce tracé.');
          }
          final figures = theme.textTheme.labelMedium;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  const Icon(Icons.trending_up, size: 16),
                  const SizedBox(width: 4),
                  Text('${profile.ascentM.round()} m', style: figures),
                  const SizedBox(width: 16),
                  const Icon(Icons.trending_down, size: 16),
                  const SizedBox(width: 4),
                  Text('${profile.descentM.round()} m', style: figures),
                ],
              ),
              const SizedBox(height: 4),
              ElevationChart(
                points: profile.points,
                color: mobility.display.color,
                height: _chartHeight,
              ),
            ],
          );
        },
      ),
    );
  }

  static Widget _note(ThemeData theme, String text) => Text(
    text,
    style: theme.textTheme.bodySmall?.copyWith(
      color: theme.colorScheme.onSurfaceVariant,
    ),
  );
}
