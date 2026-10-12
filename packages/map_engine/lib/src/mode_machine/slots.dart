// mode_context.dart
import 'slot.dart';
import "package:collection/collection.dart";

import 'mode.dart';

// slots.dart
final class Slots {
  const Slots._(this._values);
  static const empty = Slots._({});
  final Map<Slot, Object> _values;

  T? get<T extends Object>(Slot<T> slot) => _values[slot] as T?;

  /// `null` retire le slot. Renvoie `this` si rien ne change.
  Slots withSlot(Slot slot, Object? value) {
    if (_values[slot] == value) return this;
    final next = {..._values};
    value == null ? next.remove(slot) : next[slot] = value;
    return Slots._(next);
  }

  /// Applique plusieurs changements. Renvoie `this` si rien ne change.
  Slots withSlots(Iterable<SlotChange> changes) =>
      changes.fold(this, (ctx, c) => ctx.withSlot(c.$1, c.$2));
  // ModeContext
  Slots afterTransition(Mode to) {
    final kept = {
      for (final e in _values.entries)
        if (to.retainedSlots.contains(e.key)) e.key: e.value,
    };
    return kept.length == _values.length ? this : Slots._(kept);
  }

  @override
  bool operator ==(Object other) =>
      other is Slots && const MapEquality().equals(other._values, _values);
  @override
  int get hashCode => Object.hashAllUnordered(
    _values.entries.map((e) => Object.hash(e.key, e.value)),
  );
}
