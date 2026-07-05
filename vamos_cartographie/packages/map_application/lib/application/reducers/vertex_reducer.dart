import 'package:map_application/effects/map_effect.dart';
import 'package:map_application/map_application.dart';

TransitionResult reduceVertex(MapMode state, MapIntents intent) {
  return switch (intent) {
    UpdateVertexPosition _ => TransitionResult(
      nextState: state,
      effects: [
        MoveVertexEffect(
          vertexRef: intent.vertexRef,
          newPosition: intent.position,
        ),
      ],
    ),

    _ => TransitionResult(nextState: state),
  };
}

// TransitionResult _reduceDraggingVertex(
//   DraggingVertex state,
//   MapIntents intent,
// ) {
//   if (intent is PointerMoved) {
//     return TransitionResult(
//       nextState: state,
//       effects: [
//         // MoveVertexEffect(
//         //   vertexId: state.vertexId,
//         //   newPosition: intent.position,
//         // ),
//       ],
//     );
//   }

//   if (intent is PointerReleased) {
//     return TransitionResult(
//       nextState: MapMode.vertexSelected(vertexId: state.vertexId),
//     );
//   }

//   return TransitionResult(nextState: state);
// }
