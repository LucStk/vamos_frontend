// injection/app_scope.dart
import 'package:domain_core/domain/collection_store.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod/riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/domain_features.dart';
import 'package:vamos_cartographie/domain_features/route/injection/route_store.dart';
import 'package:vamos_cartographie/map/camera/camera_director_provider.dart';
import 'package:vamos_cartographie/map/camera/map_camera_provider.dart';
import 'package:vamos_cartographie/map/mode/map_mode.dart';
part "scopes/trip_edit_scope.dart";
part "scopes/explore_scope.dart";
part "scopes/create_trip_scope.dart";
part 'mode_scope.g.dart';

@Riverpod(
  keepAlive: true,
  dependencies: [mapMode, exploreScope, tripEditScope, tripCreateScope],
)
HandlerRegistry handlerRegistry(Ref ref) {
  return HandlerRegistry(switch (ref.watch(mapModeProvider)) {
    ExploreMode() => ref.watch(exploreScopeProvider),
    TripMode() => ref.watch(tripEditScopeProvider),
    CreateTripMode() => ref.watch(tripCreateScopeProvider),
  });
}
