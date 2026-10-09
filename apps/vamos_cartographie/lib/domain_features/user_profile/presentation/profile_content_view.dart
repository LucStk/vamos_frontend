import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:user_profile_application/domain/user_profile_model.dart';
import '../providers/my_trips_provider.dart';
import '/ui_kit/layouts/app_page_scaffold.dart';
import '/domain_features/auth/providers/auth_controller.dart';
import 'edit_profile_page.dart';
import 'profile_header_view.dart';
import 'trip_presentation/trip_library.dart';

class ProfileContent extends ConsumerWidget {
  const ProfileContent({super.key, required this.profile});

  final UserProfile profile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);
    final tripsAsync = ref.watch(myTripsProvider);

    return AppPageScaffold(
      title: 'Mon profil',
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Mes voyages', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),

            tripsAsync.when(
              loading: () => const Center(
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: CircularProgressIndicator(),
                ),
              ),
              error: (error, stackTrace) => Column(
                children: [
                  const Text('Impossible de charger tes voyages.'),
                  TextButton(
                    onPressed: () => ref.invalidate(myTripsProvider),
                    child: const Text('Réessayer'),
                  ),
                ],
              ),
              data: (trips) => TripLibrary(
                trips: trips,
                onOpenTrip: (trip) {
                  // À raccorder à ta route de voyage.
                },
                onCreateTrip: () {
                  // À raccorder à ton parcours de création.
                },
              ),
            ),

            const SizedBox(height: 32),

            ProfileHeader(profile: profile),
            IconButton(
              tooltip: 'Modifier',
              icon: const Icon(Icons.edit_outlined),
              onPressed: authState.isLoading
                  ? null
                  : () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const EditProfilePage(),
                        ),
                      );
                    },
            ),
            const SizedBox(height: 32),

            Text('À propos', style: Theme.of(context).textTheme.titleMedium),

            const SizedBox(height: 8),

            Text(
              profile.bio.isEmpty
                  ? 'Aucune biographie renseignée.'
                  : profile.bio,
              style: Theme.of(context).textTheme.bodyLarge,
            ),

            const SizedBox(height: 32),

            FilledButton.tonal(
              onPressed: authState.isLoading
                  ? null
                  : () => _signOut(context, ref),
              child: authState.isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Se déconnecter'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _signOut(BuildContext context, WidgetRef ref) async {
    await ref.read(authControllerProvider.notifier).signOut();

    if (!context.mounted) {
      return;
    }

    final authState = ref.read(authControllerProvider);

    if (authState.hasError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Impossible de se déconnecter : ${authState.error}'),
        ),
      );
    }
    // } else {
    //   // ref.read(meProvider.notifier).
    //   const ExploreRoute().go(context);
    // }
  }
}
