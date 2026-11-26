// lib/dev/dev_root.dart
import 'dart:math' as math;

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

/// Aperçu smartphone pour le développement sur PC (voir `main_preview.dart`).
///
/// F2 bascule entre la vraie fenêtre (format PC) et un écran de téléphone
/// centré. Pas de binding personnalisé : l'app est simplement contrainte à la
/// taille du téléphone et reçoit un [MediaQuery] de téléphone, que
/// `MaterialApp` reprend tel quel.
class DevRoot extends StatefulWidget {
  const DevRoot({super.key, required this.app});
  final Widget app;

  @override
  State<DevRoot> createState() => _DevRootState();
}

class _DevRootState extends State<DevRoot> {
  // Lancer avec --dart-define=PHONE=false pour démarrer en format PC
  static const _phoneByDefault = bool.fromEnvironment(
    'PHONE',
    defaultValue: true,
  );

  late var _phone = _phoneByDefault;

  // Garde l'état de l'app (navigation, carte…) lors de la bascule F2.
  final _appKey = GlobalKey();

  void _toggle() => setState(() => _phone = !_phone);

  @override
  Widget build(BuildContext context) {
    final app = KeyedSubtree(key: _appKey, child: widget.app);
    return CallbackShortcuts(
      bindings: {const SingleActivator(LogicalKeyboardKey.f2): _toggle},
      child: Focus(
        autofocus: true,
        child: _phone ? _PhoneScreen(child: app) : app,
      ),
    );
  }
}

/// Écran d'iPhone 16 : 393×852 points, encoche en haut, barre d'accueil en bas.
const _screenSize = Size(393, 852);
const _safeArea = EdgeInsets.only(top: 59, bottom: 34);
const _cornerRadius = 55.0;
const _margin = 24.0;

/// Affiche [child] dans un écran de téléphone centré, réduit si la fenêtre
/// est trop petite (jamais agrandi).
class _PhoneScreen extends StatelessWidget {
  const _PhoneScreen({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final host = MediaQuery.of(context);

    return ColoredBox(
      color: const Color(0xFF1D1D25),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final scale = math.min(
            1.0,
            math.min(
              (constraints.maxWidth - 2 * _margin) / _screenSize.width,
              (constraints.maxHeight - 2 * _margin) / _screenSize.height,
            ),
          );
          if (scale <= 0) return const SizedBox.shrink();

          return Center(
            child: SizedBox(
              width: _screenSize.width * scale,
              height: _screenSize.height * scale,
              // FittedBox met à l'échelle le dessin ET les clics/gestes.
              child: FittedBox(
                child: SizedBox.fromSize(
                  size: _screenSize,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(_cornerRadius),
                    child: MediaQuery(
                      data: host.copyWith(
                        size: _screenSize,
                        padding: _safeArea,
                        viewPadding: _safeArea,
                        viewInsets: EdgeInsets.zero,
                        systemGestureInsets: EdgeInsets.zero,
                        displayFeatures: const [],
                      ),
                      child: child,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
