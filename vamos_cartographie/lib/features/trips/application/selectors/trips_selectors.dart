import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/features/trips/application/providers/trips_notifier.dart';

import 'package:flutter/foundation.dart';
import 'package:vamos_cartographie/features/trips/domain/trip.dart';
part 'trips_selectors.g.dart';

@riverpod
ValueListenable<int>? tripListenable(Ref ref, int id) {
  final asyncStore = ref.watch(tripsProvider);

  return asyncStore.value?[id]?.listenable;
}

@riverpod
Trip? trip(Ref ref, int id) {
  final asyncStore = ref.watch(tripsProvider);

  return asyncStore.value?[id]?.value;
}
