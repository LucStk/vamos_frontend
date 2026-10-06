import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../routing/routes/auth_routes.dart';
import '../../auth/providers/auth_providers.dart';
import '../providers/user_session_providers.dart';

class AccountButton extends ConsumerWidget {
  const AccountButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authStateProvider);

    return Material(
      elevation: 4,
      color: Theme.of(context).colorScheme.surface,
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        width: 48,
        height: 48,
        child: InkResponse(
          containedInkWell: true,
          highlightShape: BoxShape.circle,
          onTap: () => const ProfileRoute().go(context),
          child: authState.when(
            loading: () => const AccountButtonPlaceholder(),
            error: (_, _) => const LoggedOutAccountContent(),
            data: (user) {
              if (user == null) {
                return const LoggedOutAccountContent();
              }

              return const LoggedInAccountContent();
            },
          ),
        ),
      ),
    );
  }
}

class LoggedOutAccountContent extends StatelessWidget {
  const LoggedOutAccountContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Icon(Icons.person_outline);
  }
}

class LoggedInAccountContent extends ConsumerWidget {
  const LoggedInAccountContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final meState = ref.watch(meProvider);

    final imageUrl = switch (meState) {
      AsyncData(value: final me) when me != null =>
        me.profile?.profilePictureUrl,
      _ => null,
    };

    return CircleAvatar(
      radius: 18,
      backgroundImage: imageUrl != null ? NetworkImage(imageUrl) : null,
      child: imageUrl == null ? const Icon(Icons.person) : null,
    );
  }
}

class AccountButtonPlaceholder extends StatelessWidget {
  const AccountButtonPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 20,
      height: 20,
      child: CircularProgressIndicator(strokeWidth: 2),
    );
  }
}
