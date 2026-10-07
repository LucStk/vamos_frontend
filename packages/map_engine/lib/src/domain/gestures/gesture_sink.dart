import '../space/offset_type.dart';
import 'map_gesture.dart';

abstract interface class GestureSink {
  void send(MapGesture event, ScreenOffset offset);
}
