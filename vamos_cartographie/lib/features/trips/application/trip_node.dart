import 'package:flutter/foundation.dart';
import 'package:vamos_cartographie/features/trips/domain/trip.dart';

class TripNode {
  TripNode(this.value);

  Trip value;
  final ValueNotifier<int> _vn = ValueNotifier(0);

  void set(Trip v) {
    value = v;
    _vn.value++;
  }

  ValueListenable<int> get listenable => _vn;
}
