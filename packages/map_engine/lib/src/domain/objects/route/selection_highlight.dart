import 'package:map_engine/src/domain/objects/map_objects.dart';
import 'package:trip_application/trip_application.dart';

final class SelectionHighlight extends MapObject {
  SelectionHighlight({required this.tripId});
  final TripId tripId;
  @override
  bool isDraggable = false;

  @override
  bool isHitTestable = false;

  @override
  bool operator ==(Object other) =>
      other is SelectionHighlight && other.tripId == tripId;
  @override
  int get hashCode => Object.hash(SelectionHighlight, tripId);
}
