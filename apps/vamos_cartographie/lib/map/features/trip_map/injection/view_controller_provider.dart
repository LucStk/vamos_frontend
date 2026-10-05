import 'package:domain_core/domain/collection_store.dart';
import 'package:map_controllers/map_controllers.dart';
import 'package:map_controllers/view_trip_controller/idle_handler.dart';
import 'package:trip_application/trip_application.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/domain_features/domain_features.dart';
import 'package:vamos_cartographie/map/map.dart';
part 'view_controller_provider.g.dart';

@Riverpod(keepAlive: true, dependencies: [mapCamera])
class TripView extends _$TripView {
  @override
  ViewTripMode build(TripId tripId) {
    return ViewTripMode();
  }
  
}
