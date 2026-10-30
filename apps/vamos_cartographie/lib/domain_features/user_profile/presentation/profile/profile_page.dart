// domain_features/user_profile/presentation/profile/profile_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/user_profile/presentation/on_boarding/create_profile_page.dart';
import 'package:vamos_cartographie/domain_features/user_profile/presentation/profile/edit_profile_page.dart';
import 'package:vamos_cartographie/domain_features/user_profile/presentation/profile/profile_content_view.dart';
import 'package:vamos_cartographie/domain_features/user_profile/providers/user_session_providers.dart';
import 'package:vamos_cartographie/ui_kit/ui_kit.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({
    super.key,
    required this.onCreateTrip,
    required this.onOpenTrip,
  });

  final VoidCallback onCreateTrip;
  final ValueChanged<TripId> onOpenTrip;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final meState = ref.watch(meProvider);

    return switch (meState) {
      AsyncLoading() => const LoadingView(),

      AsyncError(:final error, :final stackTrace) => ErrorView(
        error: error,
        stackTrace: stackTrace,
      ),

      AsyncData(value: null) => const SizedBox.shrink(),
      AsyncData(value: final me) when me!.profile == null =>
        const CreateProfilePage(),

      AsyncData(value: final me) => ProfileContentView(
        profile: me!.profile!,
        onCreateTrip: onCreateTrip,
        onEditProfile: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(builder: (_) => const EditProfilePage()),
          );
        },
        onOpenTrip: (trip) => onOpenTrip(trip.id),
      ),
    };
  }
}
