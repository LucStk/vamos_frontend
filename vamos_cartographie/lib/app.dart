import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:vamos_cartographie/features/notifications/widgets/notification.dart';
import 'package:vamos_cartographie/features/trips/screens/explorer_page.dart';

class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return NotificationListenerWidget(child: child);
  }
}

class CartographieApp extends StatelessWidget {
  const CartographieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos Cartographie',
      theme: ThemeData(colorSchemeSeed: Colors.green),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('fr', 'FR'), Locale('en', 'US')],
      locale: const Locale('fr', 'FR'),
      home: const AppShell(child: ExplorerPage()),
    );
  }
}
