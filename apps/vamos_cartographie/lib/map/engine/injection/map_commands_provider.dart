import "package:map_canvas/domain/domain.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

@riverpod
List<MapDrawCommand> mapCommands(
  Ref ref,
  ProviderListenable<MapScene> sceneProvider,
) {
  final scene = ref.watch(sceneProvider);

  return [
    for (final object in scene.objects.reversed)
      object.describe(
        context: MapPaintContext(
          state: object.object.isSameAs(scene.selection)
              ? MapObjectVisualState.selected
              : MapObjectVisualState.normal,
        ),
      ),
  ];
}
