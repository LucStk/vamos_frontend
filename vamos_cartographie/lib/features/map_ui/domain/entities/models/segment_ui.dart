import 'package:trip_domain/domain/entities/entities.dart';
import 'package:vamos_cartographie/features/shared/domain/entities/mobility_types_ui.dart';

extension SegmentUi on Segment {
  MobilityTypeUi get mobilityTypeUi => MobilityTypeUi.from(mobilityType);
}
