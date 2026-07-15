import 'package:domain_core/id.dart';

abstract interface class Patch<T> implements HasId {
  bool get recomputing;
  Object? get error;
}

abstract interface class Patchable<T extends HasId> implements HasId {}
