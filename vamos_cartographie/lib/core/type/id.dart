// lib/core/types/id.dart

import 'package:flutter/foundation.dart';

@immutable
class Id<T> {
  final int value;

  const Id(this.value);

  @override
  String toString() => 'Id<$T>($value)';

  @override
  bool operator ==(Object other) => other is Id<T> && other.value == value;

  @override
  int get hashCode => Object.hash(T, value);
}
