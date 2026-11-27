import 'package:domain_core/domain_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/route/injection/route_store.dart';

/// Élévation de la portion qu'un aperçu ajouterait à la route.
///
/// Demandée à part de l'aperçu, que le service d'altitude ne doit pas
/// retarder : un nouvel aperçu a un nouvel identifiant, donc une nouvelle
/// requête. Null : pas de profil (modalité non analysée, proposition
/// remplacée, pas d'altitude).
final proposalElevationProvider = FutureProvider.autoDispose
    .family<ElevationProfile?, ({TripId tripId, Id proposalId})>((
      ref,
      key,
    ) async {
      final result = await ref
          .watch(routeRepositoryProvider)
          .fetchProposalElevation(
            tripId: key.tripId,
            proposalId: key.proposalId,
          );
      return result.fold((failure) => throw failure, (profile) => profile);
    });
