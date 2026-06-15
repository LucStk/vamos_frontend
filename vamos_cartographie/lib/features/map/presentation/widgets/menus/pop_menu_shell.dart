import 'package:flutter/material.dart';

class PopMenuShell extends StatelessWidget {
  final List<Widget> Function(BuildContext context)? buttonsBuilder;

  const PopMenuShell({super.key, this.buttonsBuilder});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(children: buttonsBuilder!(context));
  }
}
