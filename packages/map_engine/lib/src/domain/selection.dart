// modes/trip_editor/selection.dart (ou domain/ si explore et view_trip la réutilisent)
import 'package:trip_application/trip_application.dart';

sealed class Selection {
  const Selection();
}

final class SegmentSelection extends Selection {
  const SegmentSelection(this.id);
  final SegmentId id;

  @override
  bool operator ==(Object other) => other is SegmentSelection && other.id == id;
  @override
  int get hashCode => id.hashCode;
}

final class VertexSelection extends Selection {
  const VertexSelection(this.id);
  final VertexId id;

  @override
  bool operator ==(Object other) => other is VertexSelection && other.id == id;
  @override
  int get hashCode => id.hashCode;
}

class TripSelection extends Selection {
  const TripSelection(this.id);
  final TripId id;
  @override
  bool operator ==(Object other) => other is TripSelection && other.id == id;
  @override
  int get hashCode => id.hashCode;
}
