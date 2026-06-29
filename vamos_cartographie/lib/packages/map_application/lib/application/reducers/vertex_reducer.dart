import 'package:map_application/map_application.dart';

TransitionResult reduceVertex(MapMode state, MapIntents intent) {
  return switch (state) {
    VertexSelected s => _reduceVertexSelected(s, intent),
    // DraggingVertex s => _reduceDraggingVertex(s, intent),
    _ => TransitionResult(nextState: state),
  };
}

TransitionResult _reduceVertexSelected(
  VertexSelected state,
  MapIntents intent,
) {
  if (intent is StartDragVertex) {
    return TransitionResult(
      nextState: MapMode.draggingVertex(vertexId: state.vertexId),
    );
  }
  if (intent is SelectVertex) {
    return TransitionResult(
      nextState: MapMode.vertexSelected(vertexId: intent.vertexId),
    );
  }
  return TransitionResult(nextState: state);
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
