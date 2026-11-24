import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:map_engine/map_engine.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';

/// Ouvre [tripId] sur la carte, cadré sur le voyage, et referme les pages
/// posées par-dessus (profil, recherche d'utilisateurs…).
///
/// Un seul chemin pour « voir ce voyage » depuis une page : le cadrage vient
/// de [TripMode.open], donc du même mécanisme que le clic sur un voyage de la
/// carte, et il n'y a rien à redire ici de la caméra.
void openTripOnMap(BuildContext context, WidgetRef ref, TripId tripId) {
  ref.applyTransition(TripMode.open(tripId, focus: true));
  backToMap(context);
}

/// Revient à la carte, quelle que soit la pile de pages au-dessus : un simple
/// `pop()` ne reculerait que d'une page (vers la recherche, par exemple).
void backToMap(BuildContext context) => context.go('/');
