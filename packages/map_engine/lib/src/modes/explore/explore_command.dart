import '../../domain/objects/map_objects.dart';
import '../../mode_machine/command/mode_command.dart';
import '../../mode_machine/transition.dart';
import 'map_explore_mode.dart';

sealed class ExploreCommand<R extends Object>
    extends ModeCommand<MapExploreMode, R> {
  const ExploreCommand();
}

final class FocusTrip extends ExploreCommand<Done> {
  const FocusTrip(this.mapTrip);
  final MapTrip mapTrip;
}
//
// mixin GraphReader {
//   GraphEditor get graphEditor;
//   MapLatLngBounds? segment(SegmentId id) =>
//       graphEditor.state.segmentStore.get(id)?.current.;
// }
