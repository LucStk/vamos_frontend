import 'package:vamos_cartographie/features/features.dart';
import 'package:vamos_cartographie/features/shared/domain/entities/mobility_types_ui.dart';
import 'package:vamos_cartographie/packages/topology_engine/lib/domain/entities/entities.dart';
import 'map_element.dart';

extension SegmentUi on Segment {
  MobilityTypeUi get mobilityTypeUi => MobilityTypeUi.from(mobilityType);
}
