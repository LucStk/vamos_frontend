import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/trip/injection/trip_store.dart';
import 'package:vamos_cartographie/domain_features/trip/presentation/trip_favorite_button.dart';
import 'package:vamos_cartographie/domain_features/user_profile/presentation/follow_button.dart';
import 'package:vamos_cartographie/domain_features/user_profile/providers/profile_store.dart';
import 'package:vamos_cartographie/map/ui/chrome/profile_capsule.dart';
import 'package:vamos_cartographie/routing/routes/auth_routes.dart';

/// Qui a créé le voyage qu'on regarde : sa capsule (cliquable, elle ouvre son
/// profil), le bouton « suivre » et la mise en favori du voyage.
///
/// À n'afficher que pour le voyage de quelqu'un d'autre : c'est l'écran qui
/// en décide (`isTripOwnedProvider`), parce qu'il place aussi la bannière de
/// titre en conséquence.
class TripAuthorBar extends ConsumerWidget {
  const TripAuthorBar({super.key, required this.tripId});

  /// Sous la rangée du compte et de la recherche (qui reste utilisable).
  static const _top = 76.0;

  /// Hauteur à laisser libre sous la barre pour ce qui se place dessous (la
  /// bannière de titre) : un bouton et un peu d'air.
  static const clearance = 56.0;

  final TripId tripId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ownerId = ref.watch(
      tripRequiredProvider(tripId).select((trip) => trip.ownerId),
    );

    final owner = ref.watch(userProfileAsyncProvider(ownerId));
    final profile = owner.value;

    return SafeArea(
      child: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, _top, 16, 0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Un nom long rétrécit la capsule plutôt que de déborder.
              Flexible(
                child: ProfileCapsule(
                  profil: owner,
                  onTap: () => UserProfileRoute(ownerId.value).push(context),
                ),
              ),
              if (profile != null) ...[
                const SizedBox(width: 8),
                FollowButton(profile: profile),
              ],
              const SizedBox(width: 8),
              TripFavoriteButton(tripId: tripId),
            ],
          ),
        ),
      ),
    );
  }
}
