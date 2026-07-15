// lib/core/types/id.dart

import 'package:uuid/uuid.dart';

abstract interface class HasId {
  Id get id;
}

class Id<T> {
  final String value;
  const Id(this.value);

  factory Id.generate() => Id(const Uuid().v7());

  @override
  bool operator ==(Object other) => other is Id<T> && other.value == value;
  @override
  int get hashCode => value.hashCode;
  @override
  String toString() => value;
}

class IdGenerator {
  static int _currentId = -1;
  static int next() => _currentId--;
}
