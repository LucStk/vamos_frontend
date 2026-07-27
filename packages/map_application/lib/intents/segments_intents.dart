part of 'intents.dart';

class SelectSegment extends MapIntents {
  final SegmentId segmentId;
  const SelectSegment(this.segmentId);
}

class CreateSegment extends MapIntents {
  final VertexId startVertexId;
  final VertexId endVertexId;
  final List<LatLng> geometry;
  final MobilityType mobilityType;

  const CreateSegment({
    required this.startVertexId,
    required this.endVertexId,
    required this.geometry,
    required this.mobilityType,
  });
}

class DeleteSegment extends MapIntents {
  final SegmentId segmentId;
  const DeleteSegment({required this.segmentId});
}
