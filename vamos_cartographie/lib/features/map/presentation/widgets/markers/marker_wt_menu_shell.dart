import 'package:flutter/material.dart';
import 'package:vamos_cartographie/features/map/presentation/widgets/tap_menu.dart';

class MarkerWtMenuShell extends StatefulWidget {
  final Widget marker;
  const MarkerWtMenuShell({super.key, required this.marker});

  @override
  State<MarkerWtMenuShell> createState() => _MarkerWtMenuShellState();
}

class _MarkerWtMenuShellState extends State<MarkerWtMenuShell> {
  var openMenu = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        openMenu = !openMenu; // On inverse la valeure
      },
      child: Builder(
        builder: (context) {
          if (!openMenu) {
            return Stack(
              children: [
                MenuCard(onClose: () {}),
                widget.marker,
              ],
            );
          }
          return widget.marker;
        },
      ),
    );
  }
}
