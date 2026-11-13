import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:vamos_cartographie/domain_features/geosearch/presentation/place_search_bar.dart';
import 'package:vamos_cartographie/map/camera/camera_director_provider.dart';
import 'package:vamos_cartographie/map/camera/map_camera_provider.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/ui/chrome/account_button.dart';
import 'package:flutter/material.dart';

import 'package:riverpod_annotation/experimental/scope.dart';

@Dependencies([modeSelection, ModeMachine])
class SearchTopSheet extends ConsumerWidget {
  const SearchTopSheet({super.key});

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
                      ref.applyTransition(
                        Transition.set(
                          searchResultMarkerSlot,
                          SearchResultMarker(
                            point: ref
                                .read(mapCameraProvider)
                                .latLngToWorldOffset(r.position),
                          ),
                        ),
                      );
                      if (r.bbox != null) {
                        ref
                            .read(cameraDirectorProvider)
                            .submit(CameraRequest(FitBounds(r.bbox!)));
                      }
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
