import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stored_file_application/stored_file_application.dart';
import "package:domain_core/domain_core.dart";
import '/core/injection/injection.dart';
import '/domain_features/user_profile/data/data.dart';
import '/domain_features/user_profile/domain/domain.dart';

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
  UserProfileRepository get repository =>
      ref.read(userProfileRepositoryProvider);

  @override
  Future<Me> build() async {
    final result = await repository.getMeProfile();
    return result.fold((failure) => throw failure, (me) => me);
  }

  Future<Failure?> createProfile(String profileName) async {
    final result = await repository.createProfile(profileName);

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

  Future<Failure?> updateProfile({String? bio, StoredFileId? fileId}) async {
    final result = await repository.updateProfile(bio: bio, fileId: fileId);
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
