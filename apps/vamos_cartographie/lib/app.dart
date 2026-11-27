import 'dart:ui';

// Material et Cupertino ont quitté le framework pour material_ui et
// cupertino_ui (Flutter 3.47) ; seul GlobalWidgetsLocalizations y reste.
// On garde en plus le GlobalMaterialLocalizations déprécié : reorderable_grid
// importe encore package:flutter/material.dart et réclame SON type
// MaterialLocalizations, là où ExpansionTile réclame celui de material_ui. Un
// délégué ne sert qu'un type, donc il faut les deux tant que ce paquet n'a pas
// migré.
import 'package:cupertino_ui/cupertino_ui.dart' as cupertino_ui;
import 'package:flutter_localizations/flutter_localizations.dart' as l10n;
import 'package:material_ui/material_ui.dart';
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
        // Sans préfixe : celui de material_ui.
        GlobalMaterialLocalizations.delegate,
        cupertino_ui.GlobalCupertinoLocalizations.delegate,
        l10n.GlobalWidgetsLocalizations.delegate,
        l10n.GlobalMaterialLocalizations.delegate,
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
