import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/features/features.dart';
import 'package:vamos_cartographie/features/graph/application/graph_executor.dart';
import 'package:vamos_cartographie/features/graph/application/graph_providers.dart';
import 'package:vamos_cartographie/features/graph/store/entity_store.dart';
import 'package:vamos_cartographie/features/trips/data/providers/trips_providers.dart';
import 'package:vamos_cartographie/features/trips/application/providers/trips_notifier.dart';
import "package:vamos_cartographie/features/trips/domain/trip.dart";
import 'package:vamos_cartographie/features/trips/data/data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:riverpod/riverpod.dart";

import 'package:flutter/foundation.dart';
part 'trips_selectors.g.dart';

@riverpod
ValueListenable<Trip>? tripListenable(Ref ref, int id) {
  final store = ref.watch(TripsNotifierProvider);
  return store[id]?.listenable;
}

@riverpod
Trip trip(Ref ref, int id) {
  return ref.watch(tripsNotifierProvider)[id]!.value;
}
