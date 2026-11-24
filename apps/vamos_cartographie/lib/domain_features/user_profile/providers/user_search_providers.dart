import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:user_profile_application/domain/domain.dart';
import 'package:vamos_cartographie/domain_features/auth/providers/providers.dart';
import 'package:vamos_cartographie/domain_features/user_profile/providers/profile_store.dart';
import 'package:vamos_cartographie/domain_features/user_profile/providers/user_session_providers.dart';

part 'user_search_providers.g.dart';

enum UserSearchStatus { idle, loading, data, error }

class UserSearchState {
  const UserSearchState({
    this.status = UserSearchStatus.idle,
    this.query = '',
    this.users = const [],
    this.hasMore = false,
    this.isLoadingMore = false,
    this.errorMessage,
  });

  final UserSearchStatus status;

  /// Préfixe (sans espaces autour) auquel correspondent [users].
  final String query;
  final List<UserProfile> users;

  /// `true` quand la dernière page était pleine : il y a sans doute la suite.
  final bool hasMore;
  final bool isLoadingMore;
  final String? errorMessage;

  UserSearchState copyWith({
    UserSearchStatus? status,
    List<UserProfile>? users,
    bool? hasMore,
    bool? isLoadingMore,
  }) => UserSearchState(
    status: status ?? this.status,
    query: query,
    users: users ?? this.users,
    hasMore: hasMore ?? this.hasMore,
    isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    errorMessage: errorMessage,
  );
}

/// Recherche d'utilisateurs par début de nom (autocomplétion).
///
/// Le debounce évite une requête par frappe ; [_requestId] invalide les
/// réponses périmées (une requête plus récente est partie entre-temps).
@riverpod
class UserSearch extends _$UserSearch {
  static const _debounce = Duration(milliseconds: 250);
  static const _pageSize = 20;

  Timer? _timer;
  int _requestId = 0;

  @override
  UserSearchState build() {
    ref.onDispose(() {
      _timer?.cancel();
      _requestId++; // invalide toute réponse encore en vol
    });
    return const UserSearchState();
  }

  /// À brancher sur TextField.onChanged.
  void onQueryChanged(String text) {
    _timer?.cancel();
    final query = text.trim();

    if (query.isEmpty) {
      clear();
      return;
    }
    // Même préfixe qu'avant (espace ajouté, frappe annulée) : rien à refaire.
    if (query == state.query && state.status != UserSearchStatus.error) return;

    _timer = Timer(_debounce, () => _run(query));
  }

  Future<void> _run(String query) async {
    final id = ++_requestId;
    // On garde les anciens résultats pendant le chargement : pas de clignotement.
    state = UserSearchState(
      status: UserSearchStatus.loading,
      query: query,
      users: state.users,
    );

    final result = await ref
        .read(userProfileRepositoryProvider)
        .searchUsers(query, limit: _pageSize);
    if (id != _requestId) return;

    state = result.fold(
      (failure) => UserSearchState(
        status: UserSearchStatus.error,
        query: query,
        errorMessage: failure.message,
      ),
      (users) {
        _remember(users);
        return UserSearchState(
          status: UserSearchStatus.data,
          query: query,
          users: _withoutMe(users),
          // Sur la page brute : retirer mon profil ne veut pas dire que
          // le serveur n'a plus rien à donner.
          hasMore: users.length == _pageSize,
        );
      },
    );
  }

  /// Se chercher soi-même n'a pas d'intérêt : on ouvre son profil par le
  /// bouton du compte. Le serveur, lui, répond à tout le monde pareil.
  List<UserProfile> _withoutMe(List<UserProfile> users) {
    final me = ref.read(currentUserIdProvider);
    if (me == null) return users;
    return users.where((user) => user.id != me).toList();
  }

  /// Les résultats contiennent déjà le profil complet : on les met dans le
  /// store pour que l'ouverture du profil soit immédiate, sans second appel
  /// ni écran de chargement.
  void _remember(List<UserProfile> users) {
    var store = ref.read(profileStoreProvider);
    for (final user in users) {
      store = store.insertProfile(user);
    }
    ref.read(profileStoreProvider.notifier).emit(store);
  }

  /// Page suivante du même préfixe.
  Future<void> loadMore() async {
    final current = state;
    if (current.status != UserSearchStatus.data ||
        !current.hasMore ||
        current.isLoadingMore) {
      return;
    }

    final id = _requestId; // une nouvelle recherche incrémente et l'annule
    state = current.copyWith(isLoadingMore: true);

    final result = await ref
        .read(userProfileRepositoryProvider)
        .searchUsers(
          current.query,
          offset: current.users.length,
          limit: _pageSize,
        );
    if (id != _requestId) return;

    state = result.fold(
      // Échec : on garde la liste, le bouton « Afficher plus » permet de réessayer.
      (_) => current.copyWith(isLoadingMore: false),
      (page) {
        _remember(page);
        return current.copyWith(
          users: [...current.users, ..._withoutMe(page)],
          hasMore: page.length == _pageSize,
          isLoadingMore: false,
        );
      },
    );
  }

  void clear() {
    _timer?.cancel();
    _requestId++;
    state = const UserSearchState();
  }
}
