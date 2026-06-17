// features/map/presentation/providers/map_notifier.dart
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/features/trips/domain/trip.dart';

part 'map_notifier.g.dart';

@riverpod
class MapStateNotifier extends _$MapStateNotifier {
  final ChangeNotifier closePopMap = ChangeNotifier();

  @override
  void build(Id<Trip> tripId) {}
}
