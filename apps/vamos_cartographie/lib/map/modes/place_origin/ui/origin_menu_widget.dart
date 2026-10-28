import 'package:flutter/material.dart';
import 'package:vamos_cartographie/map/modes/shared/menus/ui/context_menu_shell.dart';

class OriginMenuWidget extends StatelessWidget {
  const OriginMenuWidget({super.key, required this.children});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return ContextMenuShell(
      maxWidth: 120,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: children,
      ),
    );
  }
}
