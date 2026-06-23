import 'package:freezed_annotation/freezed_annotation.dart';
import "media_image.dart";
import 'package:domain_core/domain_core.dart';
part 'trip.freezed.dart';

typedef TripId = Id<Trip>;

@freezed
abstract class Trip with _$Trip {
  const Trip._();
  const factory Trip({
    required TripId id,
    @Default('') String title,
    @Default('') String description,
    DateTime? date,
  }) = _Trip;
  TripDraft toDraft() {
    return TripDraft(title: title, description: description, date: date);
  }
}

@freezed
abstract class TripDraft with _$TripDraft {
  const TripDraft._();
  const factory TripDraft({
    @Default('') String title,
    @Default('') String description,
    DateTime? date,
  }) = _TripDraft;

  Trip toTrip(TripId id) {
    return Trip(id: id, title: title, description: description, date: date);
  }
}
