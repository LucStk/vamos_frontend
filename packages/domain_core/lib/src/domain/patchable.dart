import 'package:domain_core/domain_core.dart';

abstract interface class Patch<T> implements HasId {
  bool get recomputing;
  Object? get error;
}
