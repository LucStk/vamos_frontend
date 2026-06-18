import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/features/map/interaction/controllers/map_ctrl_provider.dart';
import 'package:vamos_cartographie/features/map/interaction/controllers/map_state.dart';
import 'package:vamos_cartographie/features/trips/domain/trip.dart';

abstract class AbstractLayer extends ConsumerWidget {
  final Id<Trip> tripId;
  const AbstractLayer({
    super.key,
    required this.tripId,
  }); // Cette méthode remplace le 'build' classique pour les enfants
  Widget buildWithCtrl(
    BuildContext context,
    WidgetRef ref,
    MapCtrl mapCtrl,
    MapState mapState,
  );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // On récupère le notifier (le contrôleur d'interactions)
    final mapCtrl = ref.read(mapCtrlProvider(tripId).notifier);
    final mapState = ref.read(mapCtrlProvider(tripId));

    // On passe la main à la méthode de l'enfant en lui injectant le contrôleur
    return buildWithCtrl(context, ref, mapCtrl, mapState);
  }
}
