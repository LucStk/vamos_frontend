import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:vamos_cartographie/domain_features/trip/data/graphql/__generated__/trip_mutations.ast.gql.dart';
import 'package:vamos_cartographie/map/mode/map_mode.dart';
import '../on_boarding/create_profile_page.dart';
import '/domain_features/user_profile/providers/user_session_providers.dart';
import '/ui_kit/ui_kit.dart';
import 'edit_profile_page.dart';
import "profile_content_view.dart";

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
          
          ref.watch(modeMachineProvider).apply(SetTripOriginMode.switchTo());
        },
        onEditProfile: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(builder: (_) => const EditProfilePage()),
          );
        },
        onOpenTrip: (trip) {},
      ),
    };
  }
}
