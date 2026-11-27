import 'package:flutter/foundation.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter/services.dart';

/// Interceptions du retour, consultées avant [BackScope.onBack].
///
/// Un widget qui veut « consommer » un retour (sheet dépliée à replier, menu
/// à fermer...) s'inscrit avec [set] tant qu'il en a besoin, et se désinscrit
/// avec `set(owner, null)`. La plus récente inscription passe en premier.
class BackInterceptors extends ChangeNotifier {
  final _active = <Object, VoidCallback>{};

  bool get isEmpty => _active.isEmpty;

  /// [owner] actif avec [action], ou désinscrit si [action] est null.
  void set(Object owner, VoidCallback? action) {
    if (action == null) {
      if (_active.remove(owner) != null) notifyListeners();
      return;
    }
    if (_active[owner] == action) return;
    // Retirer puis remettre : l'inscription devient la plus récente.
    _active
      ..remove(owner)
      ..[owner] = action;
    notifyListeners();
  }

  /// Exécute l'interception la plus récente. Faux s'il n'y en a aucune.
  bool consume() {
    if (_active.isEmpty) return false;
    _active.values.last();
    return true;
  }
}

/// Unique point de gestion du retour d'un écran : bouton ou geste retour
/// Android, touche Échap sur ordinateur et web.
///
/// Ordre : une interception (voir [BackScope.interceptorsOf]) d'abord, puis
/// [onBack]. Si [onBack] est null et qu'aucune interception n'est active, le
/// retour est laissé au système (fermeture de l'écran).
///
/// Ne connaît ni Riverpod ni les modes : l'écran lui passe [onBack].
/// Un seul par route : plusieurs `PopScope` dans une même route seraient tous
/// appelés pour un seul retour.
class BackScope extends StatefulWidget {
  const BackScope({
    super.key,
    required this.onBack,
    required this.child,
    this.enabled = true,
  });

  /// Retour « applicatif » (ex. mode parent). Null : rien à faire, le système
  /// gère le retour.
  final VoidCallback? onBack;

  /// Faux : le scope laisse tout passer (ni interception, ni [onBack], ni
  /// Échap). Sert quand une autre page est affichée par-dessus.
  final bool enabled;

  final Widget child;

  /// Registre de l'écran, pour s'y inscrire. Null hors d'un [BackScope].
  static BackInterceptors? interceptorsOf(BuildContext context) => context
      .getInheritedWidgetOfExactType<_BackInterceptorsScope>()
      ?.interceptors;

  @override
  State<BackScope> createState() => _BackScopeState();
}

class _BackScopeState extends State<BackScope> {
  final _interceptors = BackInterceptors();

  @override
  void dispose() {
    _interceptors.dispose();
    super.dispose();
  }

  void _goBack() {
    if (!widget.enabled) return;
    if (_interceptors.consume()) return;
    widget.onBack?.call();
  }

  @override
  Widget build(BuildContext context) {
    return _BackInterceptorsScope(
      interceptors: _interceptors,
      child: ListenableBuilder(
        listenable: _interceptors,
        builder: (context, child) => PopScope(
          // Doit être connu à l'avance (geste retour prédictif d'Android 14+).
          canPop:
              !widget.enabled ||
              (_interceptors.isEmpty && widget.onBack == null),
          onPopInvokedWithResult: (didPop, _) {
            if (!didPop) _goBack();
          },
          child: child!,
        ),
        // Le Focus reste monté même désactivé : sinon l'arbre change à chaque
        // bascule et la carte perd son état.
        child: CallbackShortcuts(
          bindings: {const SingleActivator(LogicalKeyboardKey.escape): _goBack},
          child: Focus(autofocus: true, child: widget.child),
        ),
      ),
    );
  }
}

/// Le registre ne change jamais pendant la vie du [BackScope] : pas de
/// dépendance à créer, d'où `getInheritedWidgetOfExactType` plus haut.
class _BackInterceptorsScope extends InheritedWidget {
  const _BackInterceptorsScope({
    required this.interceptors,
    required super.child,
  });

  final BackInterceptors interceptors;

  @override
  bool updateShouldNotify(_BackInterceptorsScope old) =>
      interceptors != old.interceptors;
}
