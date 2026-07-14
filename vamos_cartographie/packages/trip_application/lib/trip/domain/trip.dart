import 'package:domain_core/id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'trip.freezed.dart';

@freezed
abstract class Trip with _$Trip implements HasId {
  const Trip._();
  const factory Trip({
    required TripId id,
    @Default('') String title,
    @Default('') String description,
    DateTime? date,
  }) = _Trip;
}

typedef TripId = Id<Trip>;
