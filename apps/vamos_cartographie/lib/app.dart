import 'dart:ui';

// material_ui expose aussi un GlobalMaterialLocalizations, qui ne connaît pas
// fr_FR : masqué comme ici, il ne fournissait AUCUN MaterialLocalizations à
// l'app en français, et les widgets Material (ReorderableGridView…) levaient
// « No MaterialLocalizations found ». On préfixe pour prendre ceux de Flutter.
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
        l10n.GlobalMaterialLocalizations.delegate,
        l10n.GlobalWidgetsLocalizations.delegate,
        l10n.GlobalCupertinoLocalizations.delegate,
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
