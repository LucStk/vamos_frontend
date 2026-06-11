import 'package:vamos_cartographie/features/features.dart';
import 'package:vamos_cartographie/features/trips/application/trip_node.dart';

extension TripNodeX on TripNode {
  Trip get trip => value;
}
