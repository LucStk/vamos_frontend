// packages/trip_application/lib/src/waypoint/domain/stay_model.dart
import 'package:domain_core/domain_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'stay_model.freezed.dart';

typedef StayId = Id<StayInfo>;
typedef DayNoteId = Id<DayNote>;

/// Titre et notes d'une journée du calendrier.
///
/// Identifiée par `(stayId, offset)`, comme côté serveur :
/// - offset 0       : le jour d'étape qui arrive à la halte ;
/// - offset 1..n-1  : les jours passés sur place ;
/// - stayId null    : la dernière journée (celle qui finit à l'arrivée).
@freezed
abstract class DayNote with _$DayNote {
  const DayNote._();

  const factory DayNote({
    /// Null tant que le serveur ne l'a pas créée (mise à jour optimiste).
    DayNoteId? id,
    StayId? stayId,
    required int offset,
    @Default('') String title,
    @Default('') String notes,
  }) = _DayNote;

  /// Une note sans titre ni texte n'existe pas côté serveur (elle est supprimée).
  bool get isEmpty => title.trim().isEmpty && notes.trim().isEmpty;
}

/// Halte de nuit portée par un waypoint : on y dort [nights] nuits.
@freezed
abstract class StayInfo with _$StayInfo {
  const StayInfo._();

  const factory StayInfo({
    /// Null pendant la création optimiste, avant la réponse du serveur.
    StayId? id,
    @Default(1) int nights,
    @Default(<DayNote>[]) List<DayNote> dayNotes,
  }) = _StayInfo;

  DayNote? noteAt(int offset) {
    for (final n in dayNotes) {
      if (n.offset == offset) return n;
    }
    return null;
  }

  /// Change le nombre de nuits. Comme le serveur, supprime les notes des jours
  /// qui disparaissent.
  StayInfo withNights(int value) => copyWith(
    nights: value,
    dayNotes: [
      for (final n in dayNotes)
        if (n.offset < value) n,
    ],
  );

  /// Remplace (ou ajoute) la note de son offset. Une note vide est retirée.
  StayInfo withNote(DayNote note) {
    final others = [
      for (final n in dayNotes)
        if (n.offset != note.offset) n,
    ];
    final next = note.isEmpty ? others : [...others, note];
    next.sort((a, b) => a.offset.compareTo(b.offset));
    return copyWith(dayNotes: next);
  }
}
