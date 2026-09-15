import 'package:dartz/dartz.dart';
import 'package:domain_core/notification/notification.dart';
import 'package:vamos_cartographie/core/graphql/__generated__/schema.schema.gql.dart';
import 'package:vamos_cartographie/core/services/services.dart';
import 'package:vamos_cartographie/user_profile/data/graphql/graphql.dart';
import 'package:vamos_cartographie/user_profile/data/user_profile_datasource.dart';
import 'package:vamos_cartographie/user_profile/data/user_profile_exception.dart';
import 'package:vamos_cartographie/user_profile/data/user_profile_mappers.dart';
import 'package:vamos_cartographie/user_profile/domain/user_profile.dart';

class UserProfileRepository {
  final UserProfileDatasource remote;
  UserProfileRepository({required this.remote});

  Future<Either<Failure, Me>> getMeProfile() async {
    return guard(() async {
      final me = await remote.getMe();
      return me.toMeProfileModel();
    });
  }

  Future<Either<Failure, Me>> createProfile(String profileName) async {
    return guard(() async {
      final result = await remote.createProfile(profileName);

      switch (result) {
        case CreateProfileSuccessData(:final profile):
          return profile.toMeProfileModel();

        case CreateProfileErrorData(:final code):
          switch (code) {
            case GCreateProfileErrorCode.USERNAME_ALREADY_TAKEN:
              throw UsernameAlreadyTakenException();
            case GCreateProfileErrorCode.INVALID_USERNAME:
              throw InvalidUsernameException();
            default:
              throw ProfileCreationFailed();
          }
        default:
          throw const ProfileCreationFailed();
      }
    });
  }
}
