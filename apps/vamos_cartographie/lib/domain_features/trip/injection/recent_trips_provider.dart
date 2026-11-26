import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trip_application/trip_application.dart';

part 'recent_trips_provider.g.dart';

/// Un voyage récemment vu, tel qu'il est gardé sur l'appareil : juste de quoi
/// l'afficher dans une liste, sans appel réseau.
class RecentTrip {
  const RecentTrip({required this.id, required this.title});

  final TripId id;

  /// Titre au moment de la visite. Rafraîchi à chaque nouvelle visite : un
  /// voyage renommé entre deux garde l'ancien titre jusque-là.
  final String title;
}

/// Les derniers voyages ouverts, du plus récent au plus ancien, sans doublon.
///
/// Gardé **sur l'appareil** (`shared_preferences`) et non au serveur : c'est
/// une commodité locale, qui marche donc aussi sans compte. En contrepartie,
/// l'historique ne suit pas l'utilisateur d'un appareil à l'autre.
///
/// La liste n'est pas vidée à la déconnexion : elle appartient à l'appareil,
/// et ne contient que des voyages publics déjà consultés.
@Riverpod(keepAlive: true)
class RecentTrips extends _$RecentTrips {
  static const _key = 'recent_trips';

  /// Au-delà, ce n'est plus « récent ».
  static const _max = 20;

  @override
  List<RecentTrip> build() {
    // La lecture du disque est asynchrone : l'onglet est vide le temps d'un
    // aller-retour, puis se remplit d'un coup.
    _restore();
    return const [];
  }

  Future<void> _restore() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_key);
    if (raw == null) return;

    // Un voyage a déjà été ouvert pendant la lecture : il est plus récent que
    // ce qui vient du disque, on ne l'écrase pas.
    if (state.isNotEmpty) return;

    try {
      state = [
        for (final entry in (jsonDecode(raw) as List)
            .cast<Map<String, dynamic>>())
          RecentTrip(
            id: TripId(entry['id'] as String),
            title: entry['title'] as String,
          ),
      ];
    } catch (_) {
      // Illisible (écriture interrompue, format d'une version précédente) :
      // on repart de zéro plutôt que de laisser l'onglet en panne.
      await prefs.remove(_key);
    }
  }

  /// À appeler quand l'utilisateur ouvre un voyage.
  void remember(TripId id, String title) {
    state = [
      RecentTrip(id: id, title: title),
      for (final trip in state)
        if (trip.id != id) trip,
    ].take(_max).toList();

    _save();
  }

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _key,
      jsonEncode([
        for (final trip in state) {'id': trip.id.value, 'title': trip.title},
      ]),
    );
  }
}
