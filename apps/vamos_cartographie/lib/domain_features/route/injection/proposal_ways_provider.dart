import 'package:domain_core/domain_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/route/injection/route_store.dart';

/// Nature des voies de la portion qu'un aperçu ajouterait à la route, par
/// tronçons de nature constante.
///
/// Demandée à part de l'aperçu, comme son élévation : un nouvel aperçu a un
/// nouvel identifiant, donc une nouvelle requête. Null : pas de nature de voie
/// (hors vélo, proposition remplacée, tracé à main levée).
final proposalWaysProvider = FutureProvider.autoDispose
    .family<List<WaySpan>?, ({TripId tripId, Id proposalId})>((ref, key) async {
      final result = await ref
          .watch(routeRepositoryProvider)
          .fetchProposalWays(tripId: key.tripId, proposalId: key.proposalId);
      return result.fold((failure) => throw failure, (spans) => spans);
    });
