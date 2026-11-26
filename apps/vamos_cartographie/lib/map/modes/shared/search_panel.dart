import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_profile_application/domain/domain.dart';
import 'package:vamos_cartographie/domain_features/geosearch/domain/place_result.dart';
import 'package:vamos_cartographie/domain_features/geosearch/injection/place_search_notifier.dart';
import 'package:vamos_cartographie/domain_features/geosearch/presentation/place_search_result.dart';
import 'package:vamos_cartographie/domain_features/user_profile/presentation/user_tile.dart';
import 'package:vamos_cartographie/domain_features/user_profile/providers/user_search_providers.dart';
import 'package:vamos_cartographie/map/ui/chrome/back/back_scope.dart';
import 'package:vamos_cartographie/routing/routes/auth_routes.dart';

enum _SearchKind { places, people }

/// Recherche en surcouche, en haut de l'écran : un champ, deux boutons
/// (lieux / personnes) et les résultats du type choisi. Sur téléphone, elle
/// prend presque toute la largeur ; une marge reste de chaque côté.
///
/// À afficher dans un `OverlayPortal`. [onPlaceSelected] est appelé quand on
/// choisit un lieu (c'est là que la carte doit être recadrée) ; [onClose]
/// referme la surcouche. Choisir une personne ouvre son profil.
///
/// Le retour (Android, Échap) referme la recherche avant de faire autre chose.
class SearchPanel extends ConsumerStatefulWidget {
  const SearchPanel({
    super.key,
    required this.origin,
    required this.onPlaceSelected,
    required this.onClose,
  });

  final SearchOrigin origin;
  final ValueChanged<PlaceResult> onPlaceSelected;
  final VoidCallback onClose;

  @override
  ConsumerState<SearchPanel> createState() => _SearchPanelState();
}

class _SearchPanelState extends ConsumerState<SearchPanel> {
  /// Plafond pour les grands écrans : sur téléphone, c'est la largeur
  /// disponible (écran moins les marges) qui gagne.
  static const _maxWidth = 480.0;

  final _text = TextEditingController();
  _SearchKind _kind = _SearchKind.places;
  BackInterceptors? _back;

  @override
  void initState() {
    super.initState();
    final onClose = widget.onClose;
    // Après le frame : `set` notifie le `BackScope`, et le registre se cherche
    // dans un arbre déjà monté.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      final back = _back = BackScope.interceptorsOf(context);
      back?.set(this, onClose);
    });
  }

  @override
  void dispose() {
    final back = _back;
    // Même raison : l'arbre est verrouillé pendant dispose.
    WidgetsBinding.instance.addPostFrameCallback((_) => back?.set(this, null));
    _text.dispose();
    super.dispose();
  }

  void _search() {
    switch (_kind) {
      case _SearchKind.places:
        ref
            .read(placeSearchProvider.notifier)
            .onQueryChanged(_text.text, origin: widget.origin);
      case _SearchKind.people:
        ref.read(userSearchProvider.notifier).onQueryChanged(_text.text);
    }
  }

  void _clearResults() {
    ref.read(placeSearchProvider.notifier).clear();
    ref.read(userSearchProvider.notifier).clear();
  }

  void _reset() {
    _text.clear();
    _clearResults();
  }

  /// Le texte tapé est gardé : on le cherche dans l'autre type.
  void _setKind(_SearchKind kind) {
    setState(() => _kind = kind);
    _clearResults();
    _search();
  }

  void _openUser(UserProfile user) {
    UserProfileRoute(user.id.value).push(context);
    widget.onClose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ModalBarrier(color: Colors.black26, onDismiss: widget.onClose),
          SafeArea(
            child: Padding(
              // Le clavier ne doit pas cacher la liste.
              padding: EdgeInsets.fromLTRB(
                16,
                8,
                16,
                MediaQuery.viewInsetsOf(context).bottom,
              ),
              child: Align(
                // En haut, centrée : le champ est près de la loupe qui l'a
                // ouvert, et la liste des résultats descend sous lui.
                alignment: Alignment.topCenter,
                child: LayoutBuilder(
                  builder: (context, constraints) => SizedBox(
                    width: math.min(_maxWidth, constraints.maxWidth),
                    child: _unfold(_content()),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Apparition : le panneau grandit légèrement depuis le haut.
  Widget _unfold(Widget child) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(milliseconds: 180),
      curve: Curves.easeOut,
      builder: (context, t, child) => Opacity(
        opacity: t,
        child: Transform.scale(
          scale: 0.95 + 0.05 * t,
          alignment: Alignment.topCenter,
          child: child,
        ),
      ),
      child: child,
    );
  }

  Widget _content() {
    // Les deux sont observés pour rester en vie pendant que la surcouche est
    // ouverte : passer d'un type à l'autre relance la recherche sans les
    // recréer à la volée.
    final places = ref.watch(placeSearchProvider);
    final people = ref.watch(userSearchProvider);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _searchCard(),
        // Flexible : sur un écran bas, la liste se réduit plutôt que de
        // déborder.
        Flexible(
          child: switch (_kind) {
            _SearchKind.places => Results(
              state: places,
              onSelected: widget.onPlaceSelected,
            ),
            _SearchKind.people => _PeopleResults(
              state: people,
              onOpen: _openUser,
            ),
          },
        ),
      ],
    );
  }

  Widget _searchCard() {
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _text,
              autofocus: true,
              textInputAction: TextInputAction.search,
              onChanged: (_) => _search(),
              decoration: InputDecoration(
                hintText: switch (_kind) {
                  _SearchKind.places => 'Lieu, adresse ou « camping »…',
                  _SearchKind.people => 'Nom d\'utilisateur…',
                },
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
            const SizedBox(height: 8),
            SegmentedButton<_SearchKind>(
              showSelectedIcon: false,
              expandedInsets: EdgeInsets.zero,
              segments: const [
                ButtonSegment(
                  value: _SearchKind.places,
                  icon: Icon(Icons.place_outlined),
                  label: Text('Lieux'),
                ),
                ButtonSegment(
                  value: _SearchKind.people,
                  icon: Icon(Icons.person_outline),
                  label: Text('Personnes'),
                ),
              ],
              selected: {_kind},
              onSelectionChanged: (s) => _setKind(s.first),
            ),
          ],
        ),
      ),
    );
  }
}

/// Pendant de `Results` (lieux) pour les personnes : même carte, mêmes états.
class _PeopleResults extends StatelessWidget {
  const _PeopleResults({required this.state, required this.onOpen});

  final UserSearchState state;
  final ValueChanged<UserProfile> onOpen;

  @override
  Widget build(BuildContext context) {
    if (state.status == UserSearchStatus.idle) {
      return const SizedBox.shrink();
    }

    final Widget body;
    if (state.status == UserSearchStatus.error) {
      body = ListTile(
        leading: Icon(
          Icons.error_outline,
          color: Theme.of(context).colorScheme.error,
        ),
        title: Text(state.errorMessage ?? 'Recherche indisponible.'),
      );
    } else if (state.status == UserSearchStatus.data && state.users.isEmpty) {
      body = const ListTile(title: Text('Aucun résultat'));
    } else {
      body = ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: state.users.length,
        separatorBuilder: (_, _) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final user = state.users[index];
          return UserTile(user: user, onTap: () => onOpen(user));
        },
      );
    }

    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(16),
        clipBehavior: Clip.antiAlias,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 320),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (state.status == UserSearchStatus.loading)
                const LinearProgressIndicator(minHeight: 2),
              Flexible(child: body),
            ],
          ),
        ),
      ),
    );
  }
}
