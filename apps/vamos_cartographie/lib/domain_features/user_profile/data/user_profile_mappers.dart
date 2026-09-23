import 'package:vamos_cartographie/domain_features/stored_file/stored_file.dart';
import 'package:vamos_cartographie/domain_features/user_profile/data/data.dart';
import 'package:vamos_cartographie/domain_features/user_profile/domain/domain.dart';

export 'graphql/graphql.dart';

extension GUserProfileFieldsDataMapper on GUserProfileFieldsData {
  UserProfile toUserProfileModel() {
    final profilePictureModel = (profilePicture == null)
        ? null
        : profilePicture!.toDomain().url;
    return UserProfile(
      userId: userId,
      profileName: profileName,
      profilePictureUrl: profilePictureModel,
      bio: bio,
    );
  }

  Me toMeProfileModel() {
    return Me(userId: userId, profile: toUserProfileModel());
  }
}

extension GGetMeMapper on GGetMeData_me {
  Me toMeProfileModel() {
    final p = (profile == null) ? null : profile!.toUserProfileModel();
    return Me(userId: userId, profile: p);
  }
}
