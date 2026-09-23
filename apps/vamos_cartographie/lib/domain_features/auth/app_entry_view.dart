import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'presentation/presentation.dart';
import 'providers/auth_providers.dart';
import '/ui_kit/ui_kit.dart';
import '/domain_features/user_profile/user_profile.dart';

class AppEntryView extends ConsumerWidget {
  const AppEntryView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return switch (authState) {
      AsyncLoading() => const LoadingView(),

      AsyncError(:final error, :final stackTrace) => ErrorView(
        error: error,
        stackTrace: stackTrace,
      ),

      AsyncData(value: final user) when user == null => const LoginPage(),

      AsyncData(value: final _) => ProfilePage(),
    };
  }
}
