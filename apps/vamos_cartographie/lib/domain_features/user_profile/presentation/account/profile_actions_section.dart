import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '/domain_features/auth/providers/auth_controller.dart';

class ProfileActionsSection extends ConsumerWidget {
  const ProfileActionsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);
    final isLoading = authState.isLoading;

    return FilledButton.tonalIcon(
      onPressed: isLoading ? null : () => _signOut(context, ref),
      style: FilledButton.styleFrom(
        visualDensity: VisualDensity.compact,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      ),
      icon: isLoading
          ? const SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : const Icon(Icons.logout, size: 18),
      label: const Text('Se déconnecter'),
    );
  }

  Future<void> _signOut(BuildContext context, WidgetRef ref) async {
    // Tout capturer AVANT le await : le widget peut être démonté
    // dès que la session passe à null.
    final router = GoRouter.of(context);
    final messenger = ScaffoldMessenger.of(context);
    final container = ProviderScope.containerOf(context);

    await container.read(authControllerProvider.notifier).signOut();

    final state = container.read(authControllerProvider);

    if (state.hasError) {
      messenger.showSnackBar(
        SnackBar(
          content: Text('Impossible de se déconnecter : ${state.error}'),
        ),
      );
      return;
    }

    router.go('/');
  }
}
