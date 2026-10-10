// import 'package:map_canvas/map_canvas.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
// import '../../injection/map_scene.dart';
// import '../application/transition_hub.dart';
// import '/app_services/app_services.dart';
//
// part 'draw_commands_provider.g.dart';
//
// @Riverpod(dependencies: [mapScene])
// List<DrawCommand> drawCommands(Ref ref) {
//   final sceneItems = ref.watch(mapSceneProvider).items;
//   return [
//     for (final item in sceneItems.toList().reversed)
//       item.toDrawCommand(
//         context:
//             (visuals[item.object] ?? VisualState(MapObjectVisualState.normal))
//                 .contextFor(),
//       ),
//   ];
// }
