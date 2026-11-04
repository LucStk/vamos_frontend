import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/domain_features/auth/auth.dart';

class ProfileActionsSection extends ConsumerWidget {
  const ProfileActionsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(authControllerProvider).isLoading;

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
    final messenger = ScaffoldMessenger.of(context);
    await ref.read(authControllerProvider.notifier).signOut();

    final state = ref.read(authControllerProvider);

    if (state.hasError) {
      messenger.showSnackBar(
        SnackBar(
          content: Text('Impossible de se déconnecter : ${state.error}'),
        ),
      );
      return;
    }
  }
}
