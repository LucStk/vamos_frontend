import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_profile_application/domain/domain.dart';
import 'package:vamos_cartographie/domain_features/user_profile/presentation/user_tile.dart';
import 'package:vamos_cartographie/domain_features/user_profile/providers/user_search_providers.dart';
import 'package:vamos_cartographie/routing/presentation/app_back_button.dart';

/// Recherche d'un autre utilisateur par début de nom.
///
/// [onOpenUser] est appelé quand on choisit un résultat : c'est à la route
/// d'ouvrir le profil.
class UserSearchPage extends ConsumerStatefulWidget {
  const UserSearchPage({super.key, required this.onOpenUser});

  final ValueChanged<UserId> onOpenUser;

  @override
  ConsumerState<UserSearchPage> createState() => _UserSearchPageState();
}

class _UserSearchPageState extends ConsumerState<UserSearchPage> {
  final _text = TextEditingController();

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  void _reset() {
    _text.clear();
    ref.read(userSearchProvider.notifier).clear();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(userSearchProvider);

    return Scaffold(
      appBar: AppBar(
        leading: const AppBackButton(),
        title: const Text('Rechercher un utilisateur'),
      ),
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            // Évite une liste étirée sur toute la largeur en format PC.
            constraints: const BoxConstraints(maxWidth: 600),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    controller: _text,
                    autofocus: true,
                    textInputAction: TextInputAction.search,
                    onChanged: (text) => ref
                        .read(userSearchProvider.notifier)
                        .onQueryChanged(text),
                    decoration: InputDecoration(
                      hintText: 'Nom d\'utilisateur…',
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: ValueListenableBuilder<TextEditingValue>(
                        valueListenable: _text,
                        builder: (context, value, _) => value.text.isEmpty
                            ? const SizedBox.shrink()
                            : IconButton(
                                tooltip: 'Effacer',
                                icon: const Icon(Icons.close),
                                onPressed: _reset,
                              ),
                      ),
                    ),
                  ),
                ),
                if (state.status == UserSearchStatus.loading)
                  const LinearProgressIndicator(minHeight: 2),
                Expanded(
                  child: _Results(state: state, onOpenUser: widget.onOpenUser),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Results extends ConsumerWidget {
  const _Results({required this.state, required this.onOpenUser});

  final UserSearchState state;
  final ValueChanged<UserId> onOpenUser;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    switch (state.status) {
      case UserSearchStatus.idle:
        return const _Message(
          icon: Icons.person_search_outlined,
          text: 'Tapez le début d\'un nom pour trouver un utilisateur.',
        );
      case UserSearchStatus.error:
        return _Message(
          icon: Icons.error_outline,
          text: state.errorMessage ?? 'Recherche indisponible.',
          isError: true,
        );
      case UserSearchStatus.loading:
      case UserSearchStatus.data:
        break;
    }

    // Premier chargement : la barre de progression suffit.
    if (state.users.isEmpty) {
      return state.status == UserSearchStatus.data
          ? _Message(
              icon: Icons.search_off,
              text: 'Aucun utilisateur ne commence par « ${state.query} ».',
            )
          : const SizedBox.shrink();
    }

    final showFooter = state.hasMore;
    return ListView.builder(
      padding: const EdgeInsets.only(bottom: 16),
      itemCount: state.users.length + (showFooter ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == state.users.length) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Center(
              child: state.isLoadingMore
                  ? const CircularProgressIndicator()
                  : TextButton(
                      onPressed: () =>
                          ref.read(userSearchProvider.notifier).loadMore(),
                      child: const Text('Afficher plus'),
                    ),
            ),
          );
        }
        final user = state.users[index];
        return UserTile(
          user: user,
          onTap: () => onOpenUser(user.id),
          trailing: const Icon(Icons.chevron_right),
        );
      },
    );
  }
}

class _Message extends StatelessWidget {
  const _Message({
    required this.icon,
    required this.text,
    this.isError = false,
  });

  final IconData icon;
  final String text;
  final bool isError;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final color = isError ? scheme.error : scheme.onSurfaceVariant;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(height: 12),
            Text(
              text,
              textAlign: TextAlign.center,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: color),
            ),
          ],
        ),
      ),
    );
  }
}
