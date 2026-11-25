import 'dart:ui';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/app_services/connectivity/presentation/backend_health_banner.dart';
import 'package:vamos_cartographie/app_services/notification/presentation/notification_view.dart';
import 'package:vamos_cartographie/routing/app_router.dart';
import 'package:vamos_cartographie/ui_kit/theme/theme.dart';

class CartographieApp extends ConsumerWidget {
  const CartographieApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint("App rebuild");
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      routerConfig: router,
      title: 'Vamos Cartographie',
      theme: AppTheme.light(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
      ),
      supportedLocales: const [Locale('fr', 'FR'), Locale('en', 'US')],
      locale: const Locale('fr', 'FR'),
      builder: (context, child) {
        return NotificationListenerWidget(
          child: BackendHealthBanner(child: child!),
        );
      },
    );
  }
}
