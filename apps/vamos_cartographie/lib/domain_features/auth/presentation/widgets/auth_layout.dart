import 'package:flutter/material.dart';
import '/routing/presentation/app_page_scaffold.dart';

class AuthLayout extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final GlobalKey<FormState>? formKey;
  final List<Widget> children;

  const AuthLayout({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.formKey,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Icon(icon, size: 56),
        const SizedBox(height: 24),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(height: 32),
        ...children,
      ],
    );

    return AppPageScaffold(
      title: title,
      child: formKey != null ? Form(key: formKey, child: content) : content,
    );
  }
}
