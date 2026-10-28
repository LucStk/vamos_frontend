// injection/app_scope.dart
import 'package:domain_core/domain_core.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod/riverpod.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip_application.dart';
import 'package:user_profile_application/domain/user_profile_model.dart';
import 'package:vamos_cartographie/domain_features/domain_features.dart';
import 'package:vamos_cartographie/domain_features/route/injection/route_store.dart';
import 'package:vamos_cartographie/domain_features/trip/injection/trip_data_loader.dart';
import 'package:vamos_cartographie/domain_features/trip/injection/trip_store.dart';
import 'package:vamos_cartographie/map/camera/camera_director_provider.dart';
import 'package:vamos_cartographie/map/camera/map_camera_provider.dart';

part "mode_scope.g.dart";

@Riverpod(keepAlive: true, dependencies: [cameraDirector])
HandlerRegistry handlerRegistry(Ref ref) =>
    HandlerRegistry(_AppCommandScope(ref));

@Dependencies([ModeMachine])
final class _AppCommandScope implements AppCommandScope {
  const _AppCommandScope(this._ref);
  final Ref _ref;

  @override
  CameraDirector get director => _ref.read(cameraDirectorProvider);
  @override
  MapCameraController get camera => _ref.read(mapCameraProvider);
  @override
  TripEditor get tripEditor => _ref.read(tripStoreProvider.notifier);
  @override
  UserId? get currentUserId => _ref.read(currentUserIdProvider);

  @override
  TripScope forTrip(TripId tripId) => _TripScope(_ref, tripId);
}

final class _TripScope implements TripScope {
  const _TripScope(this._ref, this.tripId);
  final Ref _ref;
  final TripId tripId;
  // _AppCommandScope
  @override
  Future<Failure?> ensureTripLoaded() =>
      _ref.read(ensureTripLoadedProvider(tripId).future);

  @override
  Trip get trip => _ref.read(tripRequiredProvider(tripId));

  @override
  RouteEditor get routeEditor => _ref.read(routeStoreProvider(tripId).notifier);

  @override
  WaypointEditor get waypointEditor =>
      _ref.read(waypointStoreProvider(tripId).notifier);

  @override
  RouteFields? get route =>
      _ref.read(routeStoreProvider(tripId)).route?.current;

  @override
  void patchRoute(RoutePatchModel value) =>
      _ref.read(routeStoreProvider(tripId).notifier).patchRoute(value);

  @override
  RouteSectionFields? section(SectionId id) =>
      _ref.read(routeStoreProvider(tripId)).sectionStore.get(id)?.current;
}
