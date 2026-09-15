import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/core/injection/injection.dart';
import 'package:vamos_cartographie/user_profile/data/user_profile_datasource.dart';
import 'package:vamos_cartographie/user_profile/data/user_profile_repository.dart';
import 'package:vamos_cartographie/user_profile/domain/user_profile.dart';
import "package:domain_core/domain_core.dart";

part "user_session_providers.g.dart";

@riverpod
UserProfileDatasource userRemoteDatasource(Ref ref) {
  return UserProfileDatasource(ref.watch(clientProvider));
}

@riverpod
UserProfileRepository userProfileRepository(Ref ref) {
  return UserProfileRepository(ref.watch(userRemoteDatasourceProvider));
}

@Riverpod(keepAlive: true)
class MeNotifier extends _$MeNotifier {
  @override
  Future<Me> build() async {
    final result = await ref.read(userProfileRepositoryProvider).getMeProfile();
    return result.fold((failure) => throw failure, (me) => me);
  }

  Future<Failure?> createProfile(String profileName) async {
    final result = await ref
        .read(userProfileRepositoryProvider)
        .createProfile(profileName);

    return result.fold(
      (failure) {
        return failure;
      },
      (me) {
        state = AsyncData(me);
        return;
      },
    );
  }
}
