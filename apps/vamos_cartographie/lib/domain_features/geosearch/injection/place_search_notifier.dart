import 'dart:async';

import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/domain_features/geosearch/data/geosearch_failures.dart';
import 'package:vamos_cartographie/domain_features/geosearch/domain/place_result.dart';
import 'package:vamos_cartographie/domain_features/geosearch/injection/geosearch_providers.dart';

part 'place_search_notifier.g.dart';

/// Position de recherche (centre de la carte ou position GPS). Évaluée au
/// moment de l'appel pour toujours utiliser la valeur la plus récente.
typedef SearchOrigin = LatLng? Function();

enum PlaceSearchStatus { idle, loading, data, error }

class PlaceSearchState {
  const PlaceSearchState({
    this.status = PlaceSearchStatus.idle,
    this.response = SearchResponse.empty,
    this.errorMessage,
  });

  final PlaceSearchStatus status;
  final SearchResponse response;
  final String? errorMessage;
}

@riverpod
class PlaceSearch extends _$PlaceSearch {
  static const _debounce = Duration(milliseconds: 350);
  static const _minLength = 2;

  Timer? _timer;
  int _requestId = 0;

  @override
  PlaceSearchState build() {
    ref.onDispose(() {
      _timer?.cancel();
      _requestId++; // invalide toute réponse encore en vol
    });
    return const PlaceSearchState();
  }

  /// À brancher sur TextField.onChanged.
  void onQueryChanged(String text, {required SearchOrigin origin}) {
    _timer?.cancel();
    final query = text.trim();

    if (query.length < _minLength) {
      clear();
      return;
    }
    _timer = Timer(_debounce, () => _run(query, origin));
  }

  Future<void> _run(String query, SearchOrigin origin) async {
    final id = ++_requestId;
    state = const PlaceSearchState(status: PlaceSearchStatus.loading);

    try {
      final response = await ref
          .read(geosearchRepositoryProvider)
          .search(query, origin: origin());
      if (id != _requestId) return; // une requête plus récente est partie
      state = PlaceSearchState(
        status: PlaceSearchStatus.data,
        response: response,
      );
    } on GeosearchFailure catch (failure) {
      if (id != _requestId) return;
      state = PlaceSearchState(
        status: PlaceSearchStatus.error,
        errorMessage: failure.message,
      );
    } catch (_) {
      if (id != _requestId) return;
      state = const PlaceSearchState(
        status: PlaceSearchStatus.error,
        errorMessage: 'Recherche indisponible.',
      );
    }
  }

  void clear() {
    _timer?.cancel();
    _requestId++;
    state = const PlaceSearchState();
  }
}
