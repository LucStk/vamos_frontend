// domain_features/user_profile/presentation/profile/profile_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip_application.dart';
import 'package:user_profile_application/domain/domain.dart';
import 'package:vamos_cartographie/domain_features/user_profile/presentation/profile/profile_content.dart';
import 'package:vamos_cartographie/domain_features/user_profile/user_profile.dart';
import 'package:vamos_cartographie/routing/presentation/app_page_scaffold.dart';

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

    return switch (profileState) {
      AsyncLoading() => const _ProfileLoading(),
      AsyncError() => const _ProfileError(),
      AsyncData(value: null) => const _ProfileError(),
      AsyncData(value: final profile) => ProfileContent.viewer(
        onOpenUser: onOpenUser,
        profile: profile!,
        onOpenTrip: (trip) => onOpenTrip(trip.id),
      ),
    };
  }
}

/// Chargement : une vraie page (fond opaque, bouton retour). Sans elle, la
/// carte, qui vit derrière les pages, apparaîtrait le temps du chargement.
class _ProfileLoading extends StatelessWidget {
  const _ProfileLoading();

  @override
  Widget build(BuildContext context) => const AppPageScaffold(
    title: 'Profil',
    child: CircularProgressIndicator(),
  );
}

class _ProfileError extends StatelessWidget {
  const _ProfileError();

  @override
  Widget build(BuildContext context) => const AppPageScaffold(
    title: 'Profil',
    child: Text('Ce profil est introuvable.', textAlign: TextAlign.center),
  );
}
