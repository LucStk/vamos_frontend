// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_search_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Recherche d'utilisateurs par début de nom (autocomplétion).
///
/// Le debounce évite une requête par frappe ; [_requestId] invalide les
/// réponses périmées (une requête plus récente est partie entre-temps).

@ProviderFor(UserSearch)
final userSearchProvider = UserSearchProvider._();

/// Recherche d'utilisateurs par début de nom (autocomplétion).
///
/// Le debounce évite une requête par frappe ; [_requestId] invalide les
/// réponses périmées (une requête plus récente est partie entre-temps).
final class UserSearchProvider
    extends $NotifierProvider<UserSearch, UserSearchState> {
  /// Recherche d'utilisateurs par début de nom (autocomplétion).
  ///
  /// Le debounce évite une requête par frappe ; [_requestId] invalide les
  /// réponses périmées (une requête plus récente est partie entre-temps).
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

String _$userSearchHash() => r'8a0038e9db171eee1f228ab38bd1fa528a609ddf';

/// Recherche d'utilisateurs par début de nom (autocomplétion).
///
/// Le debounce évite une requête par frappe ; [_requestId] invalide les
/// réponses périmées (une requête plus récente est partie entre-temps).

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
