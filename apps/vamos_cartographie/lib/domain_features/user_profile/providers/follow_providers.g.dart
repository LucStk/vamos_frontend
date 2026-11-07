// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follow_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Les utilisateurs qui suivent [userId].
///
/// Lecture seule : un simple fetch, mis en cache par Riverpod tant que
/// quelqu'un l'écoute (autoDispose). Pour forcer un rechargement :
/// `ref.invalidate(userFollowersProvider(userId))`.

@ProviderFor(userFollowers)
final userFollowersProvider = UserFollowersFamily._();

/// Les utilisateurs qui suivent [userId].
///
/// Lecture seule : un simple fetch, mis en cache par Riverpod tant que
/// quelqu'un l'écoute (autoDispose). Pour forcer un rechargement :
/// `ref.invalidate(userFollowersProvider(userId))`.

final class UserFollowersProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<UserProfile>>,
          List<UserProfile>,
          FutureOr<List<UserProfile>>
        >
    with
        $FutureModifier<List<UserProfile>>,
        $FutureProvider<List<UserProfile>> {
  /// Les utilisateurs qui suivent [userId].
  ///
  /// Lecture seule : un simple fetch, mis en cache par Riverpod tant que
  /// quelqu'un l'écoute (autoDispose). Pour forcer un rechargement :
  /// `ref.invalidate(userFollowersProvider(userId))`.
  UserFollowersProvider._({
    required UserFollowersFamily super.from,
    required UserId super.argument,
  }) : super(
         retry: null,
         name: r'userFollowersProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$userFollowersHash();

  @override
  String toString() {
    return r'userFollowersProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<UserProfile>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<UserProfile>> create(Ref ref) {
    final argument = this.argument as UserId;
    return userFollowers(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is UserFollowersProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$userFollowersHash() => r'd59cc107f5dfa7a889ad8986aa6fac2a08fbf467';

/// Les utilisateurs qui suivent [userId].
///
/// Lecture seule : un simple fetch, mis en cache par Riverpod tant que
/// quelqu'un l'écoute (autoDispose). Pour forcer un rechargement :
/// `ref.invalidate(userFollowersProvider(userId))`.

final class UserFollowersFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<UserProfile>>, UserId> {
  UserFollowersFamily._()
    : super(
        retry: null,
        name: r'userFollowersProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Les utilisateurs qui suivent [userId].
  ///
  /// Lecture seule : un simple fetch, mis en cache par Riverpod tant que
  /// quelqu'un l'écoute (autoDispose). Pour forcer un rechargement :
  /// `ref.invalidate(userFollowersProvider(userId))`.

  UserFollowersProvider call(UserId userId) =>
      UserFollowersProvider._(argument: userId, from: this);

  @override
  String toString() => r'userFollowersProvider';
}

/// Les utilisateurs que [userId] suit.
///
/// `follow` / `unfollow` mettent à jour la liste localement (optimiste, avec
/// rollback si l'appel échoue) : pas de refetch, et tout ce qui écoute ce
/// provider (onglet Abonnements, bouton Suivre) se met à jour d'un coup.
///
/// Sémantique : `userFollowingProvider(me).notifier.follow(target)` veut dire
/// « moi, je suis target ».

@ProviderFor(UserFollowing)
final userFollowingProvider = UserFollowingFamily._();

/// Les utilisateurs que [userId] suit.
///
/// `follow` / `unfollow` mettent à jour la liste localement (optimiste, avec
/// rollback si l'appel échoue) : pas de refetch, et tout ce qui écoute ce
/// provider (onglet Abonnements, bouton Suivre) se met à jour d'un coup.
///
/// Sémantique : `userFollowingProvider(me).notifier.follow(target)` veut dire
/// « moi, je suis target ».
final class UserFollowingProvider
    extends $AsyncNotifierProvider<UserFollowing, List<UserProfile>> {
  /// Les utilisateurs que [userId] suit.
  ///
  /// `follow` / `unfollow` mettent à jour la liste localement (optimiste, avec
  /// rollback si l'appel échoue) : pas de refetch, et tout ce qui écoute ce
  /// provider (onglet Abonnements, bouton Suivre) se met à jour d'un coup.
  ///
  /// Sémantique : `userFollowingProvider(me).notifier.follow(target)` veut dire
  /// « moi, je suis target ».
  UserFollowingProvider._({
    required UserFollowingFamily super.from,
    required UserId super.argument,
  }) : super(
         retry: null,
         name: r'userFollowingProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$userFollowingHash();

  @override
  String toString() {
    return r'userFollowingProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  UserFollowing create() => UserFollowing();

  @override
  bool operator ==(Object other) {
    return other is UserFollowingProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$userFollowingHash() => r'404519ce5a777a9f35c6fea5da63ac289b9cf4e7';

/// Les utilisateurs que [userId] suit.
///
/// `follow` / `unfollow` mettent à jour la liste localement (optimiste, avec
/// rollback si l'appel échoue) : pas de refetch, et tout ce qui écoute ce
/// provider (onglet Abonnements, bouton Suivre) se met à jour d'un coup.
///
/// Sémantique : `userFollowingProvider(me).notifier.follow(target)` veut dire
/// « moi, je suis target ».

final class UserFollowingFamily extends $Family
    with
        $ClassFamilyOverride<
          UserFollowing,
          AsyncValue<List<UserProfile>>,
          List<UserProfile>,
          FutureOr<List<UserProfile>>,
          UserId
        > {
  UserFollowingFamily._()
    : super(
        retry: null,
        name: r'userFollowingProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Les utilisateurs que [userId] suit.
  ///
  /// `follow` / `unfollow` mettent à jour la liste localement (optimiste, avec
  /// rollback si l'appel échoue) : pas de refetch, et tout ce qui écoute ce
  /// provider (onglet Abonnements, bouton Suivre) se met à jour d'un coup.
  ///
  /// Sémantique : `userFollowingProvider(me).notifier.follow(target)` veut dire
  /// « moi, je suis target ».

  UserFollowingProvider call(UserId userId) =>
      UserFollowingProvider._(argument: userId, from: this);

  @override
  String toString() => r'userFollowingProvider';
}

/// Les utilisateurs que [userId] suit.
///
/// `follow` / `unfollow` mettent à jour la liste localement (optimiste, avec
/// rollback si l'appel échoue) : pas de refetch, et tout ce qui écoute ce
/// provider (onglet Abonnements, bouton Suivre) se met à jour d'un coup.
///
/// Sémantique : `userFollowingProvider(me).notifier.follow(target)` veut dire
/// « moi, je suis target ».

abstract class _$UserFollowing extends $AsyncNotifier<List<UserProfile>> {
  late final _$args = ref.$arg as UserId;
  UserId get userId => _$args;

  FutureOr<List<UserProfile>> build(UserId userId);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<UserProfile>>, List<UserProfile>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<UserProfile>>, List<UserProfile>>,
              AsyncValue<List<UserProfile>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
