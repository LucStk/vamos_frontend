import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/route/data/graphql/graphql.dart';
import 'package:vamos_cartographie/domain_features/route/data/mappers/mobility_type_mapper.dart';

extension RouteInsightsMapper on GRouteInsightsFields {
  RouteInsights toDomain() => RouteInsights(
    computedAt: DateTime.tryParse(computedAt),
    isStale: isStale,
    elevationError: elevationError,
    waysError: waysError,
    mobilities: [
      for (final m in mobilities)
        MobilityInsights(
          mobility: m.mobilityType.toMobilityDomain(),
          ascentM: m.ascentM,
          descentM: m.descentM,
          minElevationM: m.minElevationM,
          maxElevationM: m.maxElevationM,
          profile: [
            for (final p in m.elevationProfile)
              ElevationPoint(distanceM: p.distanceM, elevationM: p.elevationM),
          ],
          totalM: m.totalM,
          analyzedM: m.analyzedM,
          roadKinds: [
            for (final s in m.roadKinds)
              WayShare(key: s.key, lengthM: s.lengthM),
          ],
          surfaces: [
            for (final s in m.surfaces) WayShare(key: s.key, lengthM: s.lengthM),
          ],
          cycleInfrastructure: [
            for (final s in m.cycleInfrastructure)
              WayShare(key: s.key, lengthM: s.lengthM),
          ],
        ),
    ],
  );
}
