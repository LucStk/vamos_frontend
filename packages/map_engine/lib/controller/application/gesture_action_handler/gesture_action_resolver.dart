// import 'package:map_engine/gesture_action_handler/gesture_action_handler.dart';

// class ChainGestureActionResolver implements GestureActionResolver {
//   ChainGestureActionResolver({required this.handlers});

//   final List<GestureActionHandler> handlers;

//   @override
//   GestureResolution? resolve(GestureResolutionContext context) {
//     for (final handler in handlers) {
//       final resolution = handler(context);
//       if (resolution != null) {
//         return resolution;
//       }
//     }
//     return null;
//   }
// }
