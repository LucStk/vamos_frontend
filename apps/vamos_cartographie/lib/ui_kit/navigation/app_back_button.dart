// ui_kit/navigation/app_back_button.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key, this.tooltip, this.fallbackLocation = '/'});

  final String? tooltip;
  final String fallbackLocation;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      tooltip: tooltip ?? MaterialLocalizations.of(context).backButtonTooltip,
      onPressed: () =>
          context.canPop() ? context.pop() : context.go(fallbackLocation),
    );
  }
}
