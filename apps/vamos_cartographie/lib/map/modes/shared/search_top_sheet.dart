import 'package:domain_core/domain_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:vamos_cartographie/domain_features/geosearch/presentation/place_search_bar.dart';
import 'package:vamos_cartographie/map/camera/camera_director_provider.dart';
import 'package:vamos_cartographie/map/camera/map_camera_provider.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/ui/chrome/account_button.dart';
import 'package:flutter/material.dart';

class SearchTopSheet extends ConsumerWidget {
  const SearchTopSheet({super.key, this.onPicked});

  /// Ce que fait le choix d'un résultat à la position donnée. Par défaut : le
  /// curseur de recherche est posé dessus.
  final Transition Function(WorldOffset point)? onPicked;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                const SizedBox(width: 15),
                Expanded(
                  child: PlaceSearchBar(
                    origin: () => ref.read(mapCameraProvider).center,
                    onSelected: (r) {
                      final point = ref
                          .read(mapCameraProvider)
                          .latLngToWorldOffset(r.position);
                      ref.applyTransition(
                        onPicked?.call(point) ??
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
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
