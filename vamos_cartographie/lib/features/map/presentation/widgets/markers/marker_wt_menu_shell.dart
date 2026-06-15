import 'package:flutter/material.dart';
import 'package:vamos_cartographie/features/map/presentation/widgets/tap_menu.dart';

class MarkerWtMenuShell extends StatefulWidget {
  final Widget marker;
  final bool isDragging;

  const MarkerWtMenuShell({
    super.key,
    required this.marker,
    required this.isDragging,
  });

  @override
  State<MarkerWtMenuShell> createState() => _MarkerWtMenuShellState();
}

class _MarkerWtMenuShellState extends State<MarkerWtMenuShell> {
  final _tooltipController = OverlayPortalController();
  final LayerLink _layerLink = LayerLink();

  @override
  void didUpdateWidget(covariant MarkerWtMenuShell oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Si le marqueur commence à être dragué, on attend la fin de la frame pour masquer
    if (widget.isDragging && _tooltipController.isShowing) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // Cette vérification évite de masquer si l'état a rechangé entre-temps
        if (mounted && _tooltipController.isShowing) {
          _tooltipController.hide();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return OverlayPortal(
      controller: _tooltipController,
      overlayChildBuilder: (BuildContext context) {
        return CompositedTransformFollower(
          link: _layerLink,
          targetAnchor: Alignment.topCenter,
          followerAnchor: Alignment.bottomCenter,
          offset: const Offset(0, -8),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: MenuCard(
              onClose: () {
                // 🎯 On sécurise la fermeture manuelle ici aussi
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  if (mounted && _tooltipController.isShowing) {
                    _tooltipController.hide();
                  }
                });
              },
            ),
          ),
        );
      },
      child: CompositedTransformTarget(
        link: _layerLink,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            if (!widget.isDragging) {
              _tooltipController.toggle();
            }
          },
          child: widget.marker,
        ),
      ),
    );
  }
}
