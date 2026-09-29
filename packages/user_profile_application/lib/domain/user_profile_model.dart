import 'package:domain_core/id.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_profile_model.freezed.dart';

@freezed
abstract class Me with _$Me implements HasId {
  const factory Me({required UserId id, required UserProfile? profile}) = _Me;
}

@freezed
abstract class UserProfile with _$UserProfile implements HasId {
  const factory UserProfile({
    required UserId id,
    required String profileName,
    String? profilePictureUrl,
    required String bio,
  }) = _UserProfile;
}

typedef UserId = Id<UserProfile>;
