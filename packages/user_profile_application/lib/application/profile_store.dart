import 'package:domain_core/domain_core.dart';
import 'package:user_profile_application/domain/domain.dart';

class ProfileStore {
  SimpleCollectionStore<UserProfile> profileStore;

  ProfileStore({required this.profileStore});
  ProfileStore.initial() : profileStore = SimpleCollectionStore<UserProfile>();

  ProfileStore copyWith({SimpleCollectionStore<UserProfile>? profileStore}) {
    return ProfileStore(profileStore: profileStore ?? this.profileStore);
  }

  ProfileStore clear() {
    return copyWith(profileStore: SimpleCollectionStore<UserProfile>());
  }

  ProfileStore insertProfile(UserProfile profile) {
    return copyWith(profileStore: profileStore.insert(profile));
  }

  ProfileStore removeProfile(UserId id) {
    return copyWith(profileStore: profileStore.remove(id));
  }
}
