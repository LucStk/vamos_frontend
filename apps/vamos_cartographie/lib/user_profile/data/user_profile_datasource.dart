import "graphql/graphql.dart";
import 'package:ferry/ferry.dart';
import 'package:vamos_cartographie/core/network/network.dart';

class UserProfileDatasource {
  final Client ferryClient;

  UserProfileDatasource(this.ferryClient);
  Future<GUserProfileFieldsData?> getMe() async {
    final data = await ferryClient.execute(GGetMeReq());
    return data.me;
  }
}
