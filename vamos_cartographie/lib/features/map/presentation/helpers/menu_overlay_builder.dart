import 'package:flutter/cupertino.dart';
import 'package:vamos_cartographie/features/map/presentation/widgets/tap_menu.dart';

Widget menuOverlayBuilder(
  BuildContext context,
  LayerLink link,
  OverlayPortalController controller,
) {
  return CompositedTransformFollower(
    link: link,
    targetAnchor: Alignment.topCenter,
    followerAnchor: Alignment.bottomCenter,
    offset: const Offset(0, -8),
    child: Align(
      alignment: Alignment.bottomCenter,
      child: MenuCard(
        onClose: () {
          // 🎯 On sécurise la fermeture manuelle ici aussi
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (context.mounted && controller.isShowing) {
              controller.hide();
            }
          });
        },
      ),
    ),
  );
}
