import 'package:flutter/material.dart';
import 'package:vamos_cartographie/map/ui/chrome/profile_capsule.dart';
import 'package:vamos_cartographie/map/ui/shared/sheets/floating_card_bottom_sheet.dart';

class FloatingHeaderCard extends StatelessWidget {
  const FloatingHeaderCard({
    super.key,
    this.profileCapsule,
    required this.child,
  });
  final Widget child;
  final ProfileCapsule? profileCapsule;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          elevation: 6,
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          clipBehavior: Clip.antiAlias,
          child: SizedBox(
            height: kFloatingCardHeight,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: child,
            ),
          ),
        ),
        const SizedBox(height: 4),
        if (profileCapsule != null)
          Align(alignment: Alignment.centerRight, child: profileCapsule),
      ],
    );
  }
}
