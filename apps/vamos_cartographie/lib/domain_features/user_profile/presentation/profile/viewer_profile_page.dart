// domain_features/user_profile/presentation/profile/profile_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip_application.dart';
import 'package:user_profile_application/domain/domain.dart';
import 'package:vamos_cartographie/domain_features/user_profile/presentation/profile/profile_content.dart';
import 'package:vamos_cartographie/domain_features/user_profile/user_profile.dart';

/// Profil public d'un autre utilisateur : lecture seule.
class ViewerProfilePage extends ConsumerWidget {
  const ViewerProfilePage({
    super.key,
    required this.userId,
    required this.onOpenTrip,
    required this.onOpenUser,
  });

  final UserId userId;

  final ValueChanged<TripId> onOpenTrip;
  final ValueChanged<UserId> onOpenUser;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profileState = ref.watch(userProfileAsyncProvider(userId));

    return Scaffold(
      appBar: AppBar(title: const Text('Profil')),
      body: switch (profileState) {
        AsyncLoading() => const Center(child: CircularProgressIndicator()),
        AsyncError() => const _ProfileError(),
        AsyncData(value: null) => const _ProfileError(),
        AsyncData(value: final profile) => ProfileContent.viewer(
          onOpenUser: onOpenUser,
          profile: profile!,
          onOpenTrip: (trip) => onOpenTrip(trip.id),
        ),
      },
    );
  }
}

class _ProfileError extends StatelessWidget {
  const _ProfileError();

  @override
  Widget build(BuildContext context) => const Center(
    child: Padding(
      padding: EdgeInsets.all(24),
      child: Text('Ce profil est introuvable.', textAlign: TextAlign.center),
    ),
  );
}
