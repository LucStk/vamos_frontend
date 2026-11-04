import 'package:gql_tristate_value/gql_tristate_value.dart';
import 'package:stored_file_application/domain/stored_file_model.dart';
import 'package:user_profile_application/user_profile_application.dart';
import 'package:vamos_cartographie/core/graphql/__generated__/schema.schema.gql.dart';
import 'package:vamos_cartographie/domain_features/user_profile/data/graphql/__generated__/user_profile_queries.var.gql.dart';

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

  Future<GUserProfileDetailsData> getUser(UserId userId) async {
    final data = await ferryClient.execute(
      GGetUserReq(vars: GGetUserVars(userId: userId.value)),
    );
    return data.user;
  }

  Future<GCreateProfileResult> createProfile(String profileName) async {
    final response = await ferryClient.execute(
      GCreateProfileReq(vars: GCreateProfileVars(profileName: profileName)),
    );

    return response.createProfile;
  }

  Future<GUserProfileDetailsData> updateProfile({
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
    return data.updateProfile;
  }
}
