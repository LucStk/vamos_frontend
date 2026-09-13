import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_profile.freezed.dart';

@freezed
abstract class Me with _$Me {
  const factory Me({required String userId, required UserProfile? profile}) =
      _Me;
}

@freezed
abstract class UserProfile with _$UserProfile {
  const factory UserProfile({
    required String userId,
    required String profileName,
    String? profilePictureUrl,
    required String bio,
    required String country,
  }) = _UserProfile;
}
