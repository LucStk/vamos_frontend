import 'package:map_engine/map_engine.dart';
import 'package:trip_application/trip_application.dart';

import '../domain/map_paint_context.dart';
import 'projected_object.dart';

typedef VisualStateResolver = MapObjectVisualState Function(MapObject);

typedef MapObjectPredicate = bool Function(MapObject);

abstract class ObjectSelected {
  bool isSameAs(MapObject object);
}

class VertexSelected extends ObjectSelected {
  final VertexId vertexId;
  VertexSelected(this.vertexId);

  @override
  bool isSameAs(MapObject? object) => switch (object) {
    MapVertex e when e.id == vertexId => true,
    _ => false,
  };
}

class SegmentSelected extends ObjectSelected {
  final SegmentId segmentId;
  SegmentSelected(this.segmentId);
  @override
  bool isSameAs(MapObject? object) => switch (object) {
    MapSegment e when e.id == segmentId => true,
    _ => false,
  };
}

class TripSelected extends ObjectSelected {
  final TripId tripId;
  TripSelected(this.tripId);
  @override
  bool isSameAs(MapObject? object) => switch (object) {
    MapTripObject e when e.id == tripId => true,
    _ => false,
  };
}

class MapScene {
  const MapScene({
    required this.objects,
    this.selection,
    this.hovered,
    this.dragging,
  });

  final List<ProjectedObject> objects;
  final ObjectSelected? selection;
  final MapObject? hovered;
  final MapObject? dragging;

  MapObject? hitTest(
    WorldOffset worldPosition,
    double scale, {
    MapObjectPredicate? ignore,
  }) {
    for (final candidate in objects) {
      if (ignore?.call(candidate.object) ?? false) {
        continue;
      }

      if (candidate.isHitAt(worldPosition, scale)) {
        return candidate.object;
      }
    }

    return null;
  }

  MapObjectVisualState visualStateOf(MapObject object) {
    if (dragging != null && dragging!.isSameAs(object)) {
      return MapObjectVisualState.dragging;
    }
    if (selection != null && selection!.isSameAs(object)) {
      return MapObjectVisualState.selected;
    }
    if (hovered != null && hovered!.isSameAs(object)) {
      return MapObjectVisualState.hovered;
    }
    return MapObjectVisualState.normal;
  }
}
