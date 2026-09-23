import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/auth/presentation/login_page.dart';
import 'package:vamos_cartographie/auth/providers/auth_providers.dart';
import 'package:vamos_cartographie/features/features.dart';
import 'package:vamos_cartographie/user_profile/user_profile.dart';

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
