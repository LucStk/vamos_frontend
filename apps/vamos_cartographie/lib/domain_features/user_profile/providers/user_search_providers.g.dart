// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_search_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UserSearch)
final userSearchProvider = UserSearchProvider._();

final class UserSearchProvider
    extends $NotifierProvider<UserSearch, UserSearchState> {
  UserSearchProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userSearchProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userSearchHash();

  @$internal
  @override
  UserSearch create() => UserSearch();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserSearchState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserSearchState>(value),
    );
  }
}

String _$userSearchHash() => r'6f3a9c2e7b1d4058a1c9e0d2b47f83a5c6e1d907';

abstract class _$UserSearch extends $Notifier<UserSearchState> {
  UserSearchState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<UserSearchState, UserSearchState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<UserSearchState, UserSearchState>,
              UserSearchState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
