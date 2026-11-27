import 'dart:ui';

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
      // Material et Cupertino ont quitté le framework pour material_ui et
      // cupertino_ui (Flutter 3.47). Cette constante de material_ui réunit les
      // trois délégués : le sien, celui de cupertino_ui et le
      // GlobalWidgetsLocalizations de flutter_localizations, qui porte
      // désormais les libellés d'accessibilité du réordonnancement.
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
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
