import 'package:domain_core/id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:user_profile_application/domain/user_profile_model.dart';
part 'trip.freezed.dart';

@freezed
abstract class Trip with _$Trip implements HasId {
  const Trip._();
  const factory Trip({
    required TripId id,
    required UserId ownerId,
    @Default('') String title,
    @Default('') String description,
    DateTime? date,
  }) = _Trip;
}

typedef TripId = Id<Trip>;
