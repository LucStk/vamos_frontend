import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_domain/trip_domain.dart';

import 'package:vamos_cartographie/features/map_editor/map_editor.dart';

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
