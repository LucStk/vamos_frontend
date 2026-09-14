import 'package:dartz/dartz.dart';
import 'package:domain_core/notification/notification.dart';
import 'package:vamos_cartographie/core/services/services.dart';
import 'package:vamos_cartographie/user_profile/data/user_profile_datasource.dart';
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
}
