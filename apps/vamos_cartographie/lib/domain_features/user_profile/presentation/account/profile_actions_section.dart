import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    await ref.read(authControllerProvider.notifier).signOut();

    if (!context.mounted) return;

    final authState = ref.read(authControllerProvider);

    if (authState.hasError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Impossible de se déconnecter : ${authState.error}'),
        ),
      );
    }
  }
}
