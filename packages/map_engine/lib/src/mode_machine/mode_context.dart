// mode_context.dart
import 'slot.dart';
import "package:collection/collection.dart";

import 'mode.dart';

final class ModeContext {
  const ModeContext._(this._values);
  static const empty = ModeContext._({});
  final Map<Slot, Object> _values;

  T? get<T extends Object>(Slot<T> slot) => _values[slot] as T?;

  /// `null` retire le slot. Renvoie `this` si rien ne change.
  ModeContext withSlot(Slot slot, Object? value) {
    if (_values[slot] == value) return this;
    final next = {..._values};
    value == null ? next.remove(slot) : next[slot] = value;
    return ModeContext._(next);
  }

  // ModeContext
  ModeContext afterTransition(Mode to) {
    final kept = {
      for (final e in _values.entries)
        if (to.retainedSlots.contains(e.key)) e.key: e.value,
    };
    return kept.length == _values.length ? this : ModeContext._(kept);
  }

  @override
  bool operator ==(Object other) =>
      other is ModeContext &&
      const MapEquality().equals(other._values, _values);
  @override
  int get hashCode => Object.hashAllUnordered(
    _values.entries.map((e) => Object.hash(e.key, e.value)),
  );
}
