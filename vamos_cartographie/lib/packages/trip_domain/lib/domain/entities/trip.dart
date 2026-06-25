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
}
