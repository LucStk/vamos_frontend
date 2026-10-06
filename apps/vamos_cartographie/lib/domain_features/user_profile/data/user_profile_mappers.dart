import 'package:user_profile_application/user_profile_application.dart';

import '../../stored_file/data/mappers/stored_file_mappers.dart';
import 'graphql/graphql.dart';

extension GUserProfileFieldsDataMapper on GUserProfileFieldsData {
  UserProfile toUserProfileModel() {
    final profilePictureModel = (profilePicture == null)
        ? null
        : profilePicture!.toDomain().url;
    return UserProfile(
      id: UserId(id),
      profileName: profileName,
      profilePictureUrl: profilePictureModel,
      bio: bio,
    );
  }

  Me toMeProfileModel() {
    return Me(id: UserId(id), profile: toUserProfileModel());
  }
}

extension GGetMeMapper on GGetMeData_me {
  Me toMeProfileModel() {
    final p = (profile == null) ? null : profile!.toUserProfileModel();
    return Me(id: UserId(id), profile: p);
  }
}
