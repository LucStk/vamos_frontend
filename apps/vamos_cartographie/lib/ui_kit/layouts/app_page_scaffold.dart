// ui_kit/layouts/app_page_scaffold.dart
import 'package:flutter/material.dart';
import 'package:vamos_cartographie/ui_kit/navigation/app_back_button.dart';

class AppPageScaffold extends StatelessWidget {
  const AppPageScaffold({
    super.key,
    required this.child,
    this.title,
    this.showBackButton = true,
    this.maxWidth = 420,
    this.padding = const EdgeInsets.all(24),
  });

  final Widget child;
  final String? title;
  final bool showBackButton;
  final double maxWidth;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: showBackButton ? const AppBackButton() : null,
        title: title != null ? Text(title!) : null,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: padding,
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxWidth),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
