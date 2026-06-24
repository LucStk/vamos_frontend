import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trip_domain/domain/types/Ids.dart';
part 'trip.freezed.dart';

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
