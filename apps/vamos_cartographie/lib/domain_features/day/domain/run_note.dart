import 'package:flutter/foundation.dart';
import 'package:trip_application/trip_application.dart';

/// Titre et notes d'un morceau de journée : la partie d'une journée parcourue
/// dans un span de mobilité.
///
/// Identifié par la halte qui termine la journée ([stayId], null pour la
/// dernière journée) et le span ([spanId]), comme côté serveur.
@immutable
class RunNote {
  const RunNote({
    required this.stayId,
    required this.spanId,
    this.title = '',
    this.notes = '',
  });

  final StayId? stayId;
  final SpanId spanId;
  final String title;
  final String notes;

  bool get isEmpty => title.trim().isEmpty && notes.trim().isEmpty;

  @override
  bool operator ==(Object other) =>
      other is RunNote &&
      other.stayId == stayId &&
      other.spanId == spanId &&
      other.title == title &&
      other.notes == notes;

  @override
  int get hashCode => Object.hash(stayId, spanId, title, notes);
}
