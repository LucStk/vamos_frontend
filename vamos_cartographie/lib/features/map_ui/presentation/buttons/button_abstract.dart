import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/features/map_editor/controllers/map_ctrl_provider.dart';
import 'package:vamos_cartographie/features/trips/domain/trip.dart';

abstract class AbstractMapButton extends ConsumerWidget {
  final Id<Trip> tripId;

  const AbstractMapButton({super.key, required this.tripId});

  // Cette méthode remplace le 'build' classique pour les enfants
  Widget buildWithCtrl(BuildContext context, WidgetRef ref, MapCtrl mapCtrl);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // On récupère le notifier (le contrôleur d'interactions)
    final mapCtrl = ref.read(mapCtrlProvider(tripId).notifier);

    // On passe la main à la méthode de l'enfant en lui injectant le contrôleur
    return buildWithCtrl(context, ref, mapCtrl);
  }
}
