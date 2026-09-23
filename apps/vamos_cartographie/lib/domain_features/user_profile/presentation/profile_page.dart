import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'on_boarding/create_profile_page.dart';
import '/domain_features/user_profile/providers/providers.dart';
import '/ui_kit/ui_kit.dart';
import 'widgets/widgets.dart';

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

      AsyncData(value: final me) when me.profile == null =>
        const CreateProfilePage(),

      AsyncData(value: final me) => ProfileContent(profile: me.profile!),
    };
  }
}
