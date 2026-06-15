import 'package:flutter/material.dart';
import 'package:vamos_cartographie/features/map/presentation/widgets/tap_menu.dart';

class MarkerWtMenuShell extends StatefulWidget {
  final Widget marker;
  const MarkerWtMenuShell({super.key, required this.marker});

  @override
  State<MarkerWtMenuShell> createState() => _MarkerWtMenuShellState();
}

class _MarkerWtMenuShellState extends State<MarkerWtMenuShell> {
  // Le contrôleur qui gère l'affichage du menu dans l'overlay
  final _tooltipController = OverlayPortalController();

  @override
  Widget build(BuildContext context) {
    return OverlayPortal(
      controller: _tooltipController,
      // Ce qui est dessiné dans l'Overlay au-dessus de la carte
      overlayChildBuilder: (BuildContext context) {
        return CompositedTransformFollower(
          link: _layerLink,
          targetAnchor: Alignment.topCenter,
          followerAnchor: Alignment.bottomCenter,
          offset: const Offset(0, -8), // Petit espace de 8px au-dessus du point
          child: Align(
            alignment: Alignment.bottomCenter,
            child: MenuCard(onClose: () => _tooltipController.hide()),
          ),
        );
      },
      // Le marqueur physique sur la carte
      child: CompositedTransformTarget(
        link: _layerLink,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => _tooltipController.toggle(),
          child: widget.marker,
        ),
      ),
    );
  }

  // Lien requis par Flutter pour connecter le marqueur et son menu flottant
  final LayerLink _layerLink = LayerLink();
}
