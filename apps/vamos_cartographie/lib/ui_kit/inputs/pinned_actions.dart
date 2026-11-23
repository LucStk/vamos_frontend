import 'package:flutter/material.dart';

/// Un emplacement, hors d'une zone qui défile, où un champ en cours d'édition
/// peut poser ses boutons (valider / annuler) pour qu'ils restent visibles.
///
/// L'hôte (ex. un dialog) place [PinnedActionsBar] sous son contenu défilant ;
/// le champ publie ses boutons avec [show] tant qu'il est en édition.
class PinnedActionsHost extends ChangeNotifier {
  Object? _owner;
  Widget? _actions;
  bool _disposed = false;

  Widget? get actions => _actions;

  void show(Object owner, Widget actions) {
    if (_disposed) return;
    _owner = owner;
    _actions = actions;
    notifyListeners();
  }

  /// Sans effet si ce n'est pas [owner] qui a publié (un autre champ a pris la
  /// place entre-temps).
  void hide(Object owner) {
    if (_disposed || _owner != owner) return;
    _owner = null;
    _actions = null;
    notifyListeners();
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }
}

class PinnedActionsScope extends InheritedWidget {
  const PinnedActionsScope({
    super.key,
    required this.host,
    required super.child,
  });

  final PinnedActionsHost host;

  static PinnedActionsHost? maybeOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<PinnedActionsScope>()?.host;

  @override
  bool updateShouldNotify(PinnedActionsScope old) => host != old.host;
}

/// La barre des boutons publiés : vide (hauteur nulle) quand il n'y en a pas.
class PinnedActionsBar extends StatelessWidget {
  const PinnedActionsBar({super.key, required this.host});

  final PinnedActionsHost host;

  @override
  Widget build(BuildContext context) => ListenableBuilder(
    listenable: host,
    builder: (context, _) {
      final actions = host.actions;
      if (actions == null) return const SizedBox.shrink();
      return Material(
        color: Theme.of(context).colorScheme.surface,
        child: Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: Theme.of(context).dividerColor),
            ),
          ),
          child: actions,
        ),
      );
    },
  );
}
