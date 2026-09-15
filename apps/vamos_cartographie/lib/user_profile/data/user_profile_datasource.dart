import 'package:gql_tristate_value/gql_tristate_value.dart';
import 'package:stored_file_application/domain/stored_file_model.dart';
import 'package:vamos_cartographie/core/graphql/__generated__/schema.schema.gql.dart';
import 'package:vamos_cartographie/user_profile/data/user_profile_exception.dart';

import "graphql/graphql.dart";
import 'package:ferry/ferry.dart';
import 'package:vamos_cartographie/core/network/network.dart';

class UserProfileDatasource {
  final Client ferryClient;

  UserProfileDatasource(this.ferryClient);
  Future<GGetMeData_me> getMe() async {
    final data = await ferryClient.execute(GGetMeReq());
    return data.me;
  }

  Future<GCreateProfileData_createProfile> createProfile(
    String profileName,
  ) async {
    final response = await ferryClient
        .request(
          GCreateProfileReq(vars: GCreateProfileVars(profileName: profileName)),
        )
        .first;

    final result = response.data?.createProfile;

    if (result == null) {
      throw const ProfileCreationFailed();
    }

    return result;
  }

  Future<GUpdateProfileData> updateProfile({
    String? bio,
    StoredFileId? fileId,
  }) async {
    final data = await ferryClient.execute(
      GUpdateProfileReq(
        vars: GUpdateProfileVars(
          input: GUpdateUserProfileInput(
            bio: (bio != null) ? Value.present(bio) : Value.absent(),
            profilePicture: (fileId != null)
                ? Value.present(fileId.value)
                : Value.absent(),
          ),
        ),
      ),
    );
    return data;
  }
}
