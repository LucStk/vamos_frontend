import 'package:map_engine/controller/domain/domain.dart';

abstract class GestureResolution {
  const GestureResolution();
}

abstract interface class GestureActionHandler {
  void emit(PointerGestureAction action);
}

abstract class GestureResolutionContext {
  const GestureResolutionContext();
}

// typedef GestureActionHandler =
//     GestureResolution? Function(GestureResolutionContext context);
