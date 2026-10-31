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

/// Menu ancré sur un hit : [HitObject] (objet touché) ou [HitGeo] (carte vide).
abstract class EventMenu<H extends MapHit> extends ContextMenuOverlay {
  const EventMenu(this.hit);

  final H hit;

  /// Point d'ancrage du menu.
  WorldOffset get position => hit.point;

  /// L'objet touché, `null` sur la carte vide.
  MapObject? get object => switch (hit) {
    HitObject(:final object) => object,
    HitGeo() => null,
  };

  /// L'objet, typé [R], s'il en est un ; null sinon.
  /// Fiable à l'exécution (teste la valeur, pas le paramètre de type).
  R? objectAs<R extends MapObject>() {
    final o = object;
    return o is R ? o : null;
  }

  /// Le hit, resserré sur un objet [R] ; null si carte vide ou autre type.
  HitObject<R>? hitAs<R extends MapObject>() => switch (hit) {
    final HitObject h => h.narrow<R>(),
    HitGeo() => null,
  };
}

class TapMenu<H extends MapHit> extends EventMenu<H> {
  const TapMenu(super.hit);
}

class DragEndMenu<H extends MapHit> extends EventMenu<H> {
  const DragEndMenu(super.hit);
}

// ---------------------------------------------------------------------------
// Lecture du menu dans ModeState : il vit dans `overlay`, pas dans un slot.
// ---------------------------------------------------------------------------

extension MenuState on ModeState {
  /// Le menu ouvert, s'il y en a un. Test contre le type le plus large :
  /// un `TapMenu<HitObject<MapSection>>` est un `EventMenu<MapHit>`.
  EventMenu<MapHit>? get menu {
    final o = overlay;
    return o is EventMenu<MapHit> ? o : null;
  }

  /// L'objet du menu ouvert, s'il est un [T].
  T? menuObjectAs<T extends MapObject>() => menu?.objectAs<T>();

  /// Le hit du menu ouvert, resserré sur [T] (objet + point d'ancrage).
  HitObject<T>? menuHitAs<T extends MapObject>() => menu?.hitAs<T>();

  /// `build` n'est appelé que si le menu ouvert l'est sur un [T].
  Transition? whenMenuOn<T extends MapObject>(
    Transition? Function(EventMenu<MapHit> menu, T object) build,
  ) {
    final m = menu;
    final object = m?.objectAs<T>();
    return (m == null || object == null) ? null : build(m, object);
  }
}

extension DragTrackingGestureMenu on DragTrackingGesture {
  /// Cible sous le pointeur, ou la position brute si la carte est vide.
  ContextMenuOverlay get dragEndMenu => DragEndMenu(target ?? HitGeo(world));
}

extension PointGestureMenu on PointGesture {
  ContextMenuOverlay get tapMenu => TapMenu(hit ?? HitGeo(world));
}
