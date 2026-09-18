// features/map/presentation/screens/map_page.dart
import 'package:flutter/material.dart';
import 'package:domain_core/domain_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/base_map/base_map_screen.dart';
import 'package:vamos_cartographie/trip/injection/trip_store.dart';
import 'package:vamos_cartographie/trip_map/editor/injection/editor_controller_provider.dart';
import 'package:vamos_cartographie/trip_map/editor/injection/trip_editor_scene.dart';
import 'package:vamos_cartographie/trip_map/editor/overlay_editor/map_bottom_sheet.dart';
import 'package:vamos_cartographie/trip_map/injection/injection.dart';

class ExploreMapScreen extends ConsumerWidget {
  const ExploreMapScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(mapEditorControllerProvider(tripId));
    return Scaffold(
      body: Stack(
        children: [
          BaseMap(
            controller: controller,
            sceneProvider: tripEditorSceneProvider(tripId),
            overlayChildren: [MapEditorBottomSheet(tripId: tripId)],
          ),
          Consumer(
            builder: (context, ref, _) {
              final loader = ref.watch(tripStoreProvider.notifier).loadTrips();

              if (!loader.isLoading) return const SizedBox.shrink();
              return const Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: LinearProgressIndicator(),
              );
            },
          ),
        ],
      ),
    );
  }
}
