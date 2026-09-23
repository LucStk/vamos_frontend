import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';
import 'package:stored_file_application/stored_file_application.dart';
import '/domain_features/user_profile/data/data.dart';
import '/domain_features/user_profile/domain/domain.dart';
import '/core/core.dart';

class UserProfileRepository {
  final UserProfileDatasource remote;
  UserProfileRepository(this.remote);

  Future<Either<Failure, Me>> getMeProfile() async {
    return guard(() async {
      final me = await remote.getMe();
      return me.toMeProfileModel();
    });
  }

  Future<Either<Failure, Me>> createProfile(String profileName) async {
    final res = await guard(() async {
      return await remote.createProfile(profileName);
    });

    return res.fold((Failure f) => Left(f), (data) {
      return switch (data) {
        CreateProfileSuccessData(:final profile) => Right(
          profile.toMeProfileModel(),
        ),
        CreateProfileErrorData(:final code) => switch (code) {
          GCreateProfileErrorCode.USERNAME_ALREADY_TAKEN => Left(
            UsernameAlreadyTakenFailure(),
          ),
          GCreateProfileErrorCode.INVALID_USERNAME => Left(
            InvalidUsernameFailure(),
          ),
          _ => Left(ProfileCreationFailed()),
        },
        _ => Left(ProfileCreationFailed()),
      };
    });
  }

  Future<Either<Failure, Me>> updateProfile({
    String? bio,
    StoredFileId? fileId,
  }) async {
    return await guard(() async {
      final d = await remote.updateProfile(bio: bio, fileId: fileId);
      return d.updateProfile.toMeProfileModel();
    });
    // return switch (data) {
    //   CreateProfileSuccessData(:final profile) => Right(
    //     profile.toMeProfileModel(),
    //   ),
    //   CreateProfileErrorData(:final code) => switch (code) {
    //     _ => Left(ProfileUpdateFailed()),
    //   },
    //   _ => Left(ProfileUpdateFailed()),
    // };
    // });
  }
}
