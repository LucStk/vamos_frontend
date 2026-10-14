import 'package:flutter/animation.dart';
import 'package:flutter/foundation.dart';
import 'package:map_canvas/map_canvas.dart';

/// Notifie à chaque tick de N'IMPORTE laquelle des transitions actives.
/// Sert de `repaint:` unique pour le CustomPainter, même si le nombre
/// de transitions actives varie dans le temps (contrairement à
/// Listenable.merge, qui fige sa liste à la construction).
class TransitionHub extends ChangeNotifier {
  void pulse() => notifyListeners();
}

/// État visuel courant d'un objet + éventuelle transition en cours.
class VisualState {
  VisualState(this.state)
    : from = state; // <-- initializer list, pas field initializer

  MapObjectVisualState state;
  late MapObjectVisualState from; // 'late' car plus de valeur par défaut inline
  AnimationController? controller;

  MapPaintContext contextFor() {
    final c = controller;
    if (c == null) return MapPaintContext(state: state);
    return MapPaintContext(from: from, state: state, t: c.value);
  }
}
