import "package:vamos_cartographie/features/media/domain/entities/entities.dart";
// ---------------------------------------------------------------------------
// Route
// ---------------------------------------------------------------------------
import "package:vamos_cartographie/core/type/has_id.dart";
import 'package:freezed_annotation/freezed_annotation.dart';

part 'trip.freezed.dart';

@freezed
abstract class Trip with _$Trip implements HasId {
  const Trip._();
  const factory Trip({
    required int id,
    @Default('') String title,
    @Default('') String description,
    DateTime? date,
    @Default([]) List<MediaImage> images,
  }) = _Trip;
  TripDraft toDraft() {
    return TripDraft(
      title: title,
      description: description,
      date: date,
      images: images,
    );
  }
}

@freezed
abstract class TripDraft with _$TripDraft {
  const TripDraft._();
  const factory TripDraft({
    @Default('') String title,
    @Default('') String description,
    DateTime? date,
    @Default([]) List<MediaImage> images,
  }) = _TripDraft;

  Trip toTrip(int id) {
    return Trip(
      id: id,
      title: title,
      description: description,
      date: date,
      images: images,
    );
  }
}
