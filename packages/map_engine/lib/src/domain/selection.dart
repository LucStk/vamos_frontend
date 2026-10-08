import 'package:trip_application/trip_application.dart';

import 'objects/map_objects.dart';
import 'slot.dart';

const selectionSlot = Slot<Selection>('selection');

sealed class Selection {
  const Selection();

  /// Cette sélection désigne-t-elle cet objet de la carte ?
  bool concerns(MapObject object);
}

final class SegmentSelection extends Selection {
  const SegmentSelection(this.id);
  final SegmentId id;

  @override
  bool concerns(MapObject object) => object is MapSegment && object.id == id;

  @override
  bool operator ==(Object other) => other is SegmentSelection && other.id == id;
  @override
  int get hashCode => id.hashCode;
}

final class VertexSelection extends Selection {
  const VertexSelection(this.id);
  final VertexId id;

  @override
  bool concerns(MapObject object) => object is MapVertex && object.id == id;

  @override
  bool operator ==(Object other) => other is VertexSelection && other.id == id;
  @override
  int get hashCode => id.hashCode;
}

final class TripSelection extends Selection {
  const TripSelection(this.id);
  final TripId id;

  @override
  bool concerns(MapObject object) => object is MapTripObject && object.id == id; // adapte au nom de ta classe trip

  @override
  bool operator ==(Object other) => other is TripSelection && other.id == id;
  @override
  int get hashCode => id.hashCode;
}
