// domain_features/user_profile/presentation/profile/profile_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip_application.dart';
import 'package:user_profile_application/domain/user_profile_model.dart';
import 'package:vamos_cartographie/domain_features/trip/injection/trip_store.dart';
import 'package:vamos_cartographie/domain_features/user_profile/presentation/on_boarding/create_profile_page.dart';
import 'package:vamos_cartographie/domain_features/user_profile/presentation/profile/edit_profile_page.dart';
import 'package:vamos_cartographie/domain_features/user_profile/presentation/profile/profile_content.dart';
import 'package:vamos_cartographie/domain_features/user_profile/providers/user_session_providers.dart';
import 'package:vamos_cartographie/ui_kit/ui_kit.dart';

class EditorProfilePage extends ConsumerWidget {
  const EditorProfilePage({
    super.key,
    required this.onCreateTrip,
    required this.onOpenTrip,
    required this.onOpenUser,
  });

  final VoidCallback onCreateTrip;
  final ValueChanged<TripId> onOpenTrip;
  final ValueChanged<UserId> onOpenUser;

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

      AsyncData(value: final me) => ProfileContent.editor(
        profile: me!.profile!,
        onCreateTrip: onCreateTrip,
        onEditProfile: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(builder: (_) => const EditProfilePage()),
          );
        },
        onOpenUser: onOpenUser,
        onDeleteTrip: (tripId) =>
            ref.read(tripStoreProvider.notifier).deleteTrip(tripId),
        onOpenTrip: (trip) => onOpenTrip(trip.id),
      ),
    };
  }
}
