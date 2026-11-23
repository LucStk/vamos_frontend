import 'package:domain_core/domain_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/route/injection/route_store.dart';

/// L'élévation et la nature des voies de la route d'un trip (null : jamais
/// calculées).
///
/// Le serveur les recalcule à chaque édition de la route : on relit dès que la
/// route ou ses calques changent, et à chaque ouverture (autoDispose).
final routeInsightsProvider = FutureProvider.autoDispose
    .family<RouteInsights?, TripId>((ref, tripId) async {
      ref.watch(
        routeStoreProvider(tripId).select(
          (s) => (s.route?.current.geometry, s.mobilitySpans, s.editSpans),
        ),
      );
      final result = await ref
          .watch(routeRepositoryProvider)
          .fetchRouteInsights(tripId);
      return result.fold((failure) => throw failure, (insights) => insights);
    });

/// Relance le calcul côté serveur (propriétaire seul), puis relit. Rend
/// l'échec éventuel ; le résultat partiel (élévation OK, voies en échec…) est
/// dans `RouteInsights.elevationError` / `waysError`.
Future<Failure?> recomputeRouteInsights(WidgetRef ref, TripId tripId) async {
  final result = await ref
      .read(routeRepositoryProvider)
      .recomputeRouteInsights(tripId);
  ref.invalidate(routeInsightsProvider(tripId));
  return result.fold((failure) => failure, (_) => null);
}
