import 'package:flutter/material.dart';
import 'package:trip_application/trip_application.dart';
import 'package:user_profile_application/domain/user_profile_model.dart';
import 'package:vamos_cartographie/domain_features/user_profile/presentation/profile/profile_card.dart';
import 'package:vamos_cartographie/domain_features/user_profile/presentation/profile/profile_tab_contents.dart';
import 'package:vamos_cartographie/domain_features/user_profile/presentation/profile/profile_tabs.dart';
import 'package:vamos_cartographie/domain_features/user_profile/presentation/trips/user_trip_library.dart';
import 'package:vamos_cartographie/routing/presentation/app_page_scaffold.dart';

class ProfileContent extends StatelessWidget {
  /// Mon propre profil : tous les onglets, avec création et suppression.
  const ProfileContent.editor({
    super.key,
    required this.profile,
    required this.onOpenTrip,
    required this.onOpenUser,
    required this.onCreateTrip,
    required this.onDeleteTrip,
    required this.onEditProfile,
  });

  /// Profil d'un autre utilisateur : lecture seule, sans l'onglet Favoris.
  const ProfileContent.viewer({
    super.key,
    required this.profile,
    required this.onOpenTrip,
    required this.onOpenUser,
  }) : onCreateTrip = null,
       onDeleteTrip = null,
       onEditProfile = null;

  final UserProfile profile;
  final ValueChanged<Trip> onOpenTrip;
  final ValueChanged<UserId> onOpenUser;
  final VoidCallback? onCreateTrip;
  final ValueChanged<TripId>? onDeleteTrip;
  final VoidCallback? onEditProfile;

  @override
  Widget build(BuildContext context) {
    final onCreate = onCreateTrip;
    final onDelete = onDeleteTrip;
    final isEditor = onCreate != null && onDelete != null;

    final tabs = [
      ProfileTab.trips,
      if (isEditor) ProfileTab.favorites, // favoris privés
      ProfileTab.following,
      ProfileTab.followers,
    ];

    return AppPageScaffold(
      title: isEditor ? 'Mon profil' : 'Profil',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ProfileCard(profile: profile, onEdit: onEditProfile),
          const SizedBox(height: 32),
          ProfileTabs(
            tabs: tabs,
            contentBuilder: (context, tab) => switch (tab) {
              ProfileTab.trips =>
                onCreate != null && onDelete != null
                    ? UserTripLibrary.editor(
                        userId: profile.id,
                        onOpenTrip: onOpenTrip,
                        onCreateTrip: onCreate,
                        onDeleteTrip: onDelete,
                      )
                    : UserTripLibrary.viewer(
                        userId: profile.id,
                        onOpenTrip: onOpenTrip,
                      ),
              ProfileTab.favorites => UserFavoriteTrips(
                userId: profile.id,
                onOpenTrip: onOpenTrip,
              ),
              ProfileTab.following => UserFollowingList(
                userId: profile.id,
                onOpenUser: onOpenUser,
              ),
              ProfileTab.followers => UserFollowersList(
                userId: profile.id,
                onOpenUser: onOpenUser,
              ),
            },
          ),
        ],
      ),
    );
  }
}
