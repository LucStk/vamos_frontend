import 'dart:ui';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/material.dart';
import 'package:vamos_cartographie/app_services/notification/presentation/notification_view.dart';
import 'package:riverpod_annotation/experimental/scope.dart';
import '/map/map.dart';

@Dependencies([
  tripEditorScene,
  mapEditorController,
  mapExploreController,
  exploreScene,
  userLocationTrigger,
  tripBoundsTrigger,
  cameraDirector,
  mapController,
  mapGestureHandler,
  MapCameraHolder,
  MapCameraChanges,
  mapCameraSnapshot,
])
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
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
      ),

      supportedLocales: const [Locale('fr', 'FR'), Locale('en', 'US')],
      locale: const Locale('fr', 'FR'),
      builder: (context, child) => NotificationListenerWidget(child: child!),
      home: const ExploreMapScreen(),
    );
  }
}
