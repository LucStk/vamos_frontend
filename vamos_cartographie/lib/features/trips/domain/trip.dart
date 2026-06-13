import "package:vamos_cartographie/features/media/domain/entities/entities.dart";
// ---------------------------------------------------------------------------
// Route
// ---------------------------------------------------------------------------
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:vamos_cartographie/core/core.dart';
part 'trip.freezed.dart';

@freezed
abstract class Trip with _$Trip implements HasId {
  const Trip._();
  const factory Trip({
    required Id<Trip> id,
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

  Trip toTrip(Id<Trip> id) {
    return Trip(
      id: id,
      title: title,
      description: description,
      date: date,
      images: images,
    );
  }
}
