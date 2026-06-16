import 'package:flutter/material.dart';
import 'package:vamos_cartographie/features/map/presentation/markers/markers.dart';
import 'package:vamos_cartographie/features/map/presentation/pop_up/pop_up_abstract.dart';

class MarkerWtMenuShell extends StatefulWidget {
  final AbstractMarker marker;
  final AbstractPopUp popUp;
  final bool isDragging;
  final OverlayPortalController controller;

  const MarkerWtMenuShell({
    super.key,
    required this.marker,
    required this.popUp,
    required this.isDragging,
    required this.controller,
  });

  @override
  State<MarkerWtMenuShell> createState() => _MarkerWtMenuShellState();
}

class _MarkerWtMenuShellState extends State<MarkerWtMenuShell> {
  final LayerLink _layerLink = LayerLink();

  @override
  void didUpdateWidget(covariant MarkerWtMenuShell oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Si le marqueur commence à être dragué, on attend la fin de la frame pour masquer
    if (widget.isDragging && widget.controller.isShowing) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        // Cette vérification évite de masquer si l'état a rechangé entre-temps
        if (mounted && widget.controller.isShowing) {
          widget.controller.hide();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return OverlayPortal(
      controller: widget.controller,
      overlayChildBuilder: (BuildContext context) {
        return CompositedTransformFollower(
          link: _layerLink,
          targetAnchor: Alignment.topCenter,
          followerAnchor: Alignment.bottomCenter,
          offset: const Offset(0, -8),
          child: Align(alignment: Alignment.bottomCenter, child: widget.popUp),
        );
      },
      child: CompositedTransformTarget(
        link: _layerLink,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            if (!widget.isDragging) {
              widget.controller.toggle();
            }
          },
          child: widget.marker,
        ),
      ),
    );
  }
}
