// ui_kit/layouts/app_page_scaffold.dart
import 'package:flutter/material.dart';
import 'app_back_button.dart';

class AppPageScaffold extends StatelessWidget {
  const AppPageScaffold({
    super.key,
    required this.child,
    this.title,
    this.showBackButton = true,
    this.padding = const EdgeInsets.all(24),
  });

  final Widget child;
  final String? title;
  final bool showBackButton;
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
          child: SingleChildScrollView(padding: padding, child: child),
        ),
      ),
    );
  }
}
