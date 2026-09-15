import 'package:dartz/dartz.dart';
import 'package:vamos_cartographie/core/graphql/__generated__/schema.schema.gql.dart';
import 'package:vamos_cartographie/core/services/services.dart';
import 'package:vamos_cartographie/user_profile/data/graphql/graphql.dart';
import 'package:vamos_cartographie/user_profile/data/user_profile_datasource.dart';
import 'package:vamos_cartographie/user_profile/data/user_profile_mappers.dart';
import 'package:vamos_cartographie/user_profile/domain/user_profile.dart';

import 'package:domain_core/domain_core.dart';

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
          _ => Left(const ProfileCreationFailed()),
        },
        _ => Left(const ProfileCreationFailed()),
      };
    });
  }
}
