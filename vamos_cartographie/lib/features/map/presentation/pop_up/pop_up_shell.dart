import 'package:flutter/material.dart';

class PopUpShell extends StatelessWidget {
  final List<Widget> Function(BuildContext context)? buttonsBuilder;

  const PopUpShell({super.key, this.buttonsBuilder});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(children: buttonsBuilder!(context));
  }
}
