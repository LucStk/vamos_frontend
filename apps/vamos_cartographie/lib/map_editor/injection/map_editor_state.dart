import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip/trip.dart';
import 'package:vamos_cartographie/map_editor/domain/domain.dart';

part 'map_editor_state.g.dart';

@Riverpod(keepAlive: true)
class MapEditorStateNotifier extends _$MapEditorStateNotifier {
  @override
  MapEditorState build(TripId tripId) => const Idle();

  /// Change le mode ou la sélection actuelle
  void emit(MapEditorState newState) => state = newState;
}
