import 'package:flutter/material.dart';
import 'package:vamos_cartographie/domain_features/user_profile/presentation/presentation.dart';
import 'package:vamos_cartographie/routing/routes/auth_routes.dart';
import '/map/map.dart';
import 'package:riverpod_annotation/experimental/scope.dart';

@Dependencies([MapEditor, MapExplore, mapScene])
class ProfileIcon extends StatelessWidget {
  const ProfileIcon({super.key});
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      color: Theme.of(context).colorScheme.surface,
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: ProfileButton(
        onLogin: () {
          const LoginRoute().push(context);
        },
        onProfile: () {
          const ProfileRoute().push(context);
        },
      ),
    );
  }
}
