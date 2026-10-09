import 'package:flutter/material.dart';
import 'package:trip_application/trip/trip.dart';
import 'package:user_profile_application/domain/user_profile_model.dart';
import '../../../../ui_kit/layouts/app_page_scaffold.dart';
import '../account/profile_actions_section.dart';
import '../trips/trip_librairy_section.dart';
import 'profile_section.dart';

class ProfileContentView extends StatelessWidget {
  const ProfileContentView({
    super.key,
    required this.profile,
    required this.onOpenTrip,
    required this.onCreateTrip,
    required this.onEditProfile,
  });

  final UserProfile profile;
  final ValueChanged<Trip> onOpenTrip;
  final VoidCallback onCreateTrip;
  final VoidCallback onEditProfile;

  @override
  Widget build(BuildContext context) {
    return AppPageScaffold(
      title: "Mon profile",
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ProfileSection(profile: profile, onEdit: onEditProfile),
            const SizedBox(height: 32),
            const ProfileActionsSection(),
          ],
        ),
      ),
    );
  }
}
