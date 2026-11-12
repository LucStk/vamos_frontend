import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/domain_features/geosearch/domain/place_result.dart';
import 'package:vamos_cartographie/domain_features/geosearch/injection/place_search_notifier.dart';
import 'package:vamos_cartographie/domain_features/geosearch/presentation/place_search_result.dart';

/// Champ de recherche + liste de résultats, à placer dans un Stack au-dessus
/// de la carte. [origin] fournit la position de recherche (centre de la carte)
/// et [onSelected] est appelé quand l'utilisateur choisit un résultat : c'est
/// là que la carte doit être recadrée.
class PlaceSearchBar extends ConsumerStatefulWidget {
  const PlaceSearchBar({
    super.key,
    required this.origin,
    required this.onSelected,
  });

  final SearchOrigin origin;
  final ValueChanged<PlaceResult> onSelected;

  @override
  ConsumerState<PlaceSearchBar> createState() => _PlaceSearchBarState();
}

class _PlaceSearchBarState extends ConsumerState<PlaceSearchBar> {
  final _text = TextEditingController();
  final _focus = FocusNode();

  @override
  void dispose() {
    _text.dispose();
    _focus.dispose();
    super.dispose();
  }

  void _select(PlaceResult place) {
    _text.text = place.name; // ne déclenche pas onChanged
    ref.read(placeSearchProvider.notifier).clear();
    _focus.unfocus();
    widget.onSelected(place);
  }

  void _reset() {
    _text.clear();
    ref.read(placeSearchProvider.notifier).clear();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(placeSearchProvider);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Material(
          elevation: 3,
          borderRadius: BorderRadius.circular(28),
          child: TextField(
            controller: _text,
            focusNode: _focus,
            onChanged: (text) => ref
                .read(placeSearchProvider.notifier)
                .onQueryChanged(text, origin: widget.origin),
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              hintText: 'Lieu, adresse ou « camping »…',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: IconButton(
                icon: const Icon(Icons.close),
                onPressed: _reset,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(28),
                borderSide: BorderSide.none,
              ),
              filled: true,
            ),
          ),
        ),
        Results(state: state, onSelected: _select),
      ],
    );
  }
}
