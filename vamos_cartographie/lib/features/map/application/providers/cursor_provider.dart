// features/map/presentation/providers/map_notifier.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:latlong2/latlong.dart';
import "package:vamos_cartographie/features/map/application/states/states.dart";

part 'cursor_provider.g.dart';

@riverpod
class MapCursorNotifier extends _$MapCursorNotifier {
  @override
  MapCursor build() {
    return const MapCursor(); // État initial de Freezed
  }

  LatLng getPosition() => state.latLng;
  void setPosition(LatLng latLng) => state = state.copyWith(latLng: latLng);
  void close() => state = state.copyWith(isOpen: false);
  void open() => state = state.copyWith(isOpen: true);
}
