import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:map_engine/map_engine.dart';
import 'package:vamos_cartographie/domain_features/user_profile/presentation/on_boarding/create_profile_page.dart';
import 'package:vamos_cartographie/domain_features/user_profile/presentation/profile/edit_profile_page.dart';
import 'package:vamos_cartographie/domain_features/user_profile/presentation/profile/profile_content_view.dart';
import 'package:vamos_cartographie/domain_features/user_profile/providers/user_session_providers.dart';
import 'package:vamos_cartographie/map/mode/helpers/mode_apply.dart';
import 'package:vamos_cartographie/map/mode/map_mode.dart';
import 'package:vamos_cartographie/ui_kit/ui_kit.dart';

import 'package:riverpod_annotation/experimental/scope.dart';

@Dependencies([modeSelection, ModeMachine])
class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

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
        onCreateTrip: () {
          ref.applyTransition(Transition.to(PlaceNewTripOrigin()));
          context.canPop() ? context.pop() : context.go("/");
        },
        onEditProfile: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(builder: (_) => const EditProfilePage()),
          );
        },
        onOpenTrip: (trip) {
          ref.watch(modeMachineProvider).apply(TripMode.open(trip.id));
          context.canPop() ? context.pop() : context.go("/");
        },
      ),
    };
  }
}
