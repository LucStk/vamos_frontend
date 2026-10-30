import 'package:domain_core/domain_core.dart';
import 'package:map_engine/src/domain/map_hit.dart';
import 'package:map_engine/src/domain/objects/map_objects.dart';
import 'package:map_engine/src/gesture_engine/map_gesture.dart';
import 'package:map_engine/src/mode_engine/mode_state.dart';
import 'package:map_engine/src/mode_engine/overlay.dart';
import 'package:map_engine/src/mode_engine/transition.dart';

abstract class ContextMenuOverlay extends Overlay {
  const ContextMenuOverlay();

  @override
  Interception intercept(MapGesture event) =>
      event is PressGesture ? Interception.dismiss : Interception.pass;

  @override
  bool? visibleAfter(MapGesture event) => switch (event) {
    DragStartGesture() || DragUpdateGesture() => false,
    DragEndGesture() || DragCancelGesture() => true,
    _ => null,
  };
}

// Remplace EventMenu / TapMenu / DragEndMenu dans ton fichier de menus.
// (ContextMenuOverlay reste inchangé.)

/// Menu ouvert sur [object] (ou sur le fond de carte : `EventMenu<Null>`).
///
/// Le paramètre [T] sert au typage STATIQUE là où on connaît l'objet à la
/// création. Pour retrouver le type à l'exécution, utiliser [objectAs] ou un
/// `switch` sur [object] : voir la note sur les génériques réifiés.
abstract class EventMenu<T extends MapObject?> extends ContextMenuOverlay {
  EventMenu(this.position, {required this.object});

  final WorldOffset position;
  final T object;

  /// L'objet, typé [R], s'il en est un ; null sinon.
  /// Fiable à l'exécution (teste la valeur, pas le paramètre de type).
  R? objectAs<R extends MapObject>() {
    final o = object;
    return o is R ? o : null;
  }

  /// Ce menu vu comme un hit typé : l'objet touché et l'endroit du tap.
  MapHit<R>? hitAs<R extends MapObject>() {
    final o = objectAs<R>();
    return o == null ? null : MapHit<R>(object: o, point: position);
  }
}

class TapMenu<T extends MapObject?> extends EventMenu<T> {
  TapMenu(super.position, {required super.object});
}

class DragEndMenu<T extends MapObject?> extends EventMenu<T> {
  DragEndMenu(super.position, {required super.object});
}

// ---------------------------------------------------------------------------
// Lecture du menu dans ModeState : il vit dans `overlay`, pas dans un slot.
// ---------------------------------------------------------------------------

extension MenuState on ModeState {
  /// Le menu ouvert, s'il y en a un. Le test se fait contre le type le plus
  /// large (`EventMenu<MapObject?>`) : un `TapMenu<MapSection>` en est un.
  EventMenu<MapObject?>? get menu {
    final o = overlay;
    return o is EventMenu<MapObject?> ? o : null;
  }

  /// L'objet du menu ouvert, s'il est un [T].
  T? menuObjectAs<T extends MapObject>() => menu?.objectAs<T>();

  /// Pendant de `withSelection` : `build` n'est appelé que si le menu ouvert
  /// l'est sur un [T]. Reçoit le menu (position...) et l'objet déjà typé.
  Transition? whenMenuOn<T extends MapObject>(
    Transition? Function(EventMenu<MapObject?> menu, T object) build,
  ) {
    final m = menu;
    final object = m?.objectAs<T>();
    return (m == null || object == null) ? null : build(m, object);
  }
}

extension DragTrasckingGestureMenu on DragTrackingGesture {
  ContextMenuOverlay get dragEndMenu =>
      DragEndMenu(hit?.point ?? world, object: element);
}

extension PointGestureMenu on PointGesture {
  ContextMenuOverlay get tapMenu =>
      TapMenu(hit?.point ?? world, object: element);
}
