import 'package:vamos_cartographie/stored_file/data/mappers/mappers.dart';
import 'package:vamos_cartographie/user_profile/data/graphql/graphql.dart';
import 'package:vamos_cartographie/user_profile/domain/user_profile.dart';

extension GUserProfileFieldsDataMapper on GUserProfileFieldsData {
  UserProfile toUserProfileModel() {
    final profilPictureModel = (profilPicture == null)
        ? null
        : profilPicture!.toRemoteModel().url;
    return UserProfile(
      userId: userId,
      profileName: profileName,
      profilePictureUrl: profilPictureModel,
      bio: bio,
      country: country,
    );
  }
}

extension GGetMeMapper on GGetMeData_me {
  Me toMeProfileModel() {
    final p = (profile == null) ? null : profile!.toUserProfileModel();
    return Me(userId: userId, profile: p);
  }
}
