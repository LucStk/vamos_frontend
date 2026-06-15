import 'package:flutter/cupertino.dart';
import 'package:vamos_cartographie/features/map/presentation/widgets/widgets.dart';

Widget menuOverlayBuilder(
  BuildContext context,
  LayerLink link,
  OverlayPortalController controller,
  PopMenu menuWidget,
) {
  return CompositedTransformFollower(
    link: link,
    targetAnchor: Alignment.topCenter,
    followerAnchor: Alignment.bottomCenter,
    offset: const Offset(0, -8),
    child: Align(alignment: Alignment.bottomCenter, child: menuWidget),
  );
}
