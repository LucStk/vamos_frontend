// packages/domain_core/lib/runtime/state_writer.dart
abstract interface class StateWriter<S> {
  S get state;
  set state(S value);
}
