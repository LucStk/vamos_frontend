import 'package:domain_core/domain_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:vamos_cartographie/domain_features/geosearch/domain/place_result.dart';
import 'package:vamos_cartographie/map/camera/camera_director_provider.dart';
import 'package:vamos_cartographie/map/camera/map_camera_provider.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/modes/shared/search_panel.dart';
import 'package:vamos_cartographie/map/ui/chrome/account_button.dart';
import 'package:flutter/material.dart';

class SearchTopSheet extends ConsumerStatefulWidget {
  const SearchTopSheet({super.key, this.onPicked});

  /// Ce que fait le choix d'un résultat à la position donnée. Par défaut : le
  /// curseur de recherche est posé dessus.
  final Transition Function(WorldOffset point)? onPicked;

  @override
  ConsumerState<SearchTopSheet> createState() => _SearchTopSheetState();
}

class _SearchTopSheetState extends ConsumerState<SearchTopSheet> {
  final _overlay = OverlayPortalController();

  void _onPlaceSelected(PlaceResult r) {
    _overlay.hide();
    final point = ref.read(mapCameraProvider).latLngToWorldOffset(r.position);
    ref.applyTransition(
      widget.onPicked?.call(point) ??
          Transition.set(
            searchResultMarkerSlot,
            SearchResultMarker(point: point),
          ),
    );
    // Un lieu sans emprise (adresse, commerce) : on centre
    // sur lui, sans dézoomer.
    final bounds = r.bbox;
    ref
        .read(cameraDirectorProvider)
        .submit(
          CameraRequest(
            bounds != null
                ? FitBounds(bounds)
                : FocusPoint(r.position, minZoom: 14),
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.topRight,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 500),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AccountButton(),
                const Spacer(),
                // La recherche s'ouvre dans la surcouche de l'écran, par-dessus
                // le reste de l'interface, tout en restant dans cet arbre de
                // widgets (les providers du mode restent accessibles).
                OverlayPortal(
                  controller: _overlay,
                  overlayChildBuilder: (_) => SearchPanel(
                    origin: () => ref.read(mapCameraProvider).center,
                    onPlaceSelected: _onPlaceSelected,
                    onClose: _overlay.hide,
                  ),
                  child: _SearchButton(onTap: _overlay.show),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Même gabarit que le bouton du compte.
class _SearchButton extends StatelessWidget {
  const _SearchButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      color: Theme.of(context).colorScheme.surface,
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        width: 48,
        height: 48,
        child: Tooltip(
          message: 'Rechercher',
          child: InkResponse(
            containedInkWell: true,
            highlightShape: BoxShape.circle,
            onTap: onTap,
            child: const Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}
