import 'package:vamos_cartographie/features/features.dart';
import 'package:vamos_cartographie/packages/topology_engine/lib/domain/entities/entities.dart';
import 'map_ui_element.dart';

class SegmentUiElement extends MapUiElement {
  final Segment segment;
  const SegmentUiElement(super.tripId, this.segment);
}
