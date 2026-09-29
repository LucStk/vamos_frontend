import 'package:vamos_cartographie/domain_features/stored_file/stored_file.dart';
import 'package:vamos_cartographie/domain_features/user_profile/data/data.dart';
import 'package:user_profile_application/user_profile_application.dart';

export 'graphql/graphql.dart';

extension GUserProfileFieldsDataMapper on GUserProfileFieldsData {
  UserProfile toUserProfileModel() {
    final profilePictureModel = (profilePicture == null)
        ? null
        : profilePicture!.toDomain().url;
    return UserProfile(
      id: UserId(userId),
      profileName: profileName,
      profilePictureUrl: profilePictureModel,
      bio: bio,
    );
  }

  Me toMeProfileModel() {
    return Me(id: UserId(userId), profile: toUserProfileModel());
  }
}

extension GGetMeMapper on GGetMeData_me {
  Me toMeProfileModel() {
    final p = (profile == null) ? null : profile!.toUserProfileModel();
    return Me(id: UserId(userId), profile: p);
  }
}
