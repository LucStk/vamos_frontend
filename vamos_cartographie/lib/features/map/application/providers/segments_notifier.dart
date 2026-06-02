// features/segments/presentation/providers/segments_notifier.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dartz/dartz.dart';
import 'package:vamos_cartographie/core/failure.dart';
import 'package:vamos_cartographie/features/segments/segments.dart';
import 'package:flutter/material.dart';

import 'package:vamos_cartographie/core/injection.dart';
part 'segments_notifier.g.dart';

@riverpod
ISegmentRepository _segmentRepository(Ref ref) {
  return getIt<ISegmentRepository>();
}

@riverpod
class SegmentsStore extends _$SegmentsStore {
  late final ISegmentRepository repository;

  @override
  Map<int, Segment> build(int tripId) {
    repository = ref.read(_segmentRepositoryProvider);

    _load(tripId);

    return {};
  }

  Future<void> _load(int tripId) async {
    final result = await repository.getSegments(tripId);

    result.fold(
      (failure) {
        debugPrint('load failed');
      },
      (segments) {
        state = {for (final w in segments) w.id: w};
      },
    );
  }

  // --- Mises à jour locales (Synchrones pour l'UI) ---

  void _addSegmentLocal(Segment segment) {
    state = {...state, segment.id: segment};
  }

  void _removeSegmentLocalById(int id) {
    final updated = Map<int, Segment>.from(state)..remove(id);
    state = updated;
  }

  void _updateSegmentLocal(Segment segment) {
    if (!state.containsKey(segment.id)) {
      throw Exception("Segment non trouvé dans le store local");
    }
    state = {...state, segment.id: segment};
  }

  // --- Opérations Distantes (Asynchrones avec le serveur) ---

  Future<void> createSegmentRemote(SegmentDraft draft) async {
    final Either<Failure, Segment> result = await repository.createSegment(
      tripId, // tripId est accessible directement via l'argument du build
      draft,
    );

    result.fold(
      (failure) => null, // Gérer l'erreur si nécessaire
      (serverSegment) => _addSegmentLocal(serverSegment),
    );
  }

  Future<void> updateSegmentRemote(int id, SegmentDraft draft) async {
    final previousState = state;

    // Mise à jour optimiste locale
    final optimisticSegment = draft.toSegment(id);
    _updateSegmentLocal(optimisticSegment);

    final Either<Failure, Segment> result = await repository.updateSegment(
      id,
      draft,
    );

    result.fold(
      (failure) {
        // Rollback en cas d'échec
        state = previousState;
      },
      (serverSegment) {
        // Synchronisation avec la vérité du serveur si différente
        if (optimisticSegment != serverSegment) {
          _updateSegmentLocal(serverSegment);
        }
      },
    );
  }

  // //TODO : Faire la requête uniquement sur la position, pas la peine d'envoyer le reste
  // Future<void> updateSegmentPositionRemote(int segmentId, LatLng latLng) async {
  //   final segment = state[segmentId];
  //   if (segment == null) {
  //     throw Exception("SegmentNotifier -> segmentId not valid key");
  //   }
  //   await updateSegmentRemote(
  //     segment.id,
  //     segment.copyWith(latLng: latLng).toDraft(),
  //   );
  // }

  // void updateSegmentPositionLocal(int segmentId, LatLng latLng) {
  //   final segment = state[segmentId];
  //   if (segment == null) return;

  //   state = {...state, segmentId: segment.copyWith(latLng: latLng)};
  // }

  Future<void> deleteSegmentRemote(int segmentId) async {
    final Either<Failure, void> result = await repository.deleteSegment(
      segmentId,
    );

    result.fold(
      (failure) => null, // Gérer l'erreur si nécessaire
      (_) => _removeSegmentLocalById(segmentId),
    );
  }
}

// --- Providers Sélecteurs pour optimiser l'UI ---

@riverpod
List<int> segmentIds(Ref ref, int tripId) {
  // Ce provider ne notifiera que si un identifiant est ajouté ou retiré
  return ref.watch(
    segmentsStoreProvider(tripId).select((map) => map.keys.toList()),
  );
}

@riverpod
Segment? segment(Ref ref, int tripId, int segmentId) {
  // Ce provider ne rebuilde le marqueur individuel QUE si ses données changent
  return ref.watch(
    segmentsStoreProvider(tripId).select((map) => map[segmentId]),
  );
}

@riverpod
List<LatLng>? segmentPoints(Ref ref, int tripId, int segmentId) {
  return ref.watch(
    segmentProvider(tripId, segmentId).select((s) => s?.intermediatePoints),
  );
}

// @riverpod
// SegmentEnum? segmentType(Ref ref, int tripId, int segmentId) {
//   return ref.watch(segmentProvider(tripId, segmentId).select((w) => w!.type));
// }
