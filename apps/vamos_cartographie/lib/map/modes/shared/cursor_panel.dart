import 'package:domain_core/domain_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/route/injection/route_store.dart';
import 'package:vamos_cartographie/map/camera/map_camera_provider.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/modes/shared/mobility_type_menu.dart';
import 'package:vamos_cartographie/map/modes/trip_edit/sketch/providers/sketch_mobility_type_provider.dart';
import 'package:vamos_cartographie/map/ui/chrome/toolbox/tool_panel.dart';

/// Panneau du curseur : le point posé par un résultat de recherche ou en
/// touchant la position de l'utilisateur.
///
/// - [canTrace] : relier la fin de la route (ou l'origine d'un voyage sans
///   route) au curseur, par un itinéraire ou en ligne droite ;
/// - [canCreateWaypoint] : créer une étape sur le curseur ;
/// - [sketchTrace] : on entre dans l'outil « Tracer » avec l'itinéraire
///   jusqu'au curseur déjà calculé (en croquis, à valider ou à supprimer), le
///   crayon posé sur le curseur ;
/// - [pencil] : le tracé en cours de l'outil « Tracer ». L'itinéraire généré
///   part alors de sa pointe (le crayon) au lieu de la fin de la route ;
/// - [showClear] : action « Retirer le curseur » (inutile quand la croix du
///   panneau fait déjà cela).
@Dependencies([modeSelection, ModeMachine])
class CursorPanel extends ConsumerWidget {
  const CursorPanel({
    super.key,
    required this.tripId,
    required this.cursor,
    this.canTrace = false,
    this.canCreateWaypoint = false,
    this.sketchTrace = false,
    this.pencil,
    this.showClear = true,
    this.error,
  });

  final TripId tripId;
  final SearchResultMarker cursor;
  final bool canTrace;
  final bool canCreateWaypoint;
  final bool sketchTrace;
  final SketchTrace? pencil;
  final bool showClear;
  final String? error;

  /// D'où part le tracé : l'arrivée de la route, ou l'origine tant qu'elle n'a
  /// aucun point. Null si le voyage n'a pas de route chargée.
  HitObject<RouteElements>? _traceStart(WidgetRef ref) {
    final route = ref.read(routeStoreProvider(tripId)).route?.current;
    if (route == null) return null;
    final camera = ref.read(mapCameraProvider);
    return route.geometry.isEmpty
        ? HitObject<RouteElements>(
            object: MapTripStart(tripId),
            point: camera.latLngToWorldOffset(route.startPoint),
          )
        : HitObject<RouteElements>(
            object: MapTripEnd(tripId),
            point: camera.latLngToWorldOffset(route.geometry.last),
          );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mobility = ref.watch(sketchMobilityTypeProvider);

    void trace(
      Transition Function(
        TripId tripId,
        HitObject<RouteElements> from,
        WorldOffset cursor,
        MobilityType mobility,
      )
      action,
    ) {
      final from = _traceStart(ref);
      if (from == null) return;
      ref.applyTransition(action(tripId, from, cursor.point, mobility));
    }

    // Itinéraire jusqu'au curseur : de la pointe du crayon s'il y en a un, de la
    // fin de la route sinon.
    void generateRoute() {
      final fromPencil = pencil;
      if (fromPencil != null) {
        ref.applyTransition(
          SketchEdition.routeFromPencil(
            tripId,
            fromPencil,
            cursor.point,
            mobility,
          ),
        );
      } else {
        trace(SketchEdition.routeToCursor);
      }
    }

    final waypoint = ToolAction(
      icon: Icons.add_location_alt_outlined,
      label: 'Créer ici',
      onPressed: () => ref.applyTransition(
        CursorActions.createWaypoint(tripId, cursor.point),
      ),
    );

    // Le curseur repose sur la route : le tracé peut partir d'ici, crayon posé
    // sur le curseur.
    final anchor = cursor.anchor;
    if (anchor != null && sketchTrace) {
      final originOnly =
          ref
              .read(routeStoreProvider(tripId))
              .route
              ?.current
              .geometry
              .isEmpty ??
          false;
      return ToolPanel(
        error: error,
        hint: switch (anchor.object) {
          MapTripStart() => 'Départ de la route.',
          MapTripEnd() => 'Arrivée de la route.',
          _ => 'Sur la route.',
        },
        secondary: canCreateWaypoint ? waypoint : null,
        primary: ToolAction(
          icon: Icons.edit_outlined,
          label: cursor.onExtremity ? 'Dessiner depuis' : 'Tracer depuis',
          onPressed: () => ref.applyTransition(
            SketchEdition.startFromCursor(
              tripId,
              anchor,
              originOnly: originOnly,
            ),
          ),
        ),
      );
    }

    return ToolPanel(
      error: error,
      hint: pencil != null ? 'Route depuis le crayon.' : null,
      settings: [
        if (canTrace)
          MobilityTypeMenu(
            selected: mobility,
            onChanged: ref.read(sketchMobilityTypeProvider.notifier).select,
          ),
      ],
      trailing: [
        if (canTrace && canCreateWaypoint && !sketchTrace) waypoint,
        if (showClear)
          ToolAction(
            icon: Icons.close,
            label: 'Retirer le curseur',
            onPressed: () => ref.applyTransition(CursorActions.clear()),
          ),
      ],
      secondary: canTrace
          ? sketchTrace
                ? waypoint
                : pencil != null
                // La ligne droite part de la fin de la route, pas du crayon.
                ? null
                : ToolAction(
                    icon: Icons.timeline,
                    label: 'Ligne droite',
                    onPressed: () => trace(SketchEdition.straightToCursor),
                  )
          : null,
      primary: canTrace
          ? sketchTrace
                ? ToolAction(
                    icon: Icons.draw,
                    label: 'Tracer jusqu’à',
                    onPressed: () => trace(SketchEdition.routeToCursor),
                  )
                : ToolAction(
                    icon: Icons.alt_route,
                    label: 'Calculer',
                    onPressed: generateRoute,
                  )
          : canCreateWaypoint
          ? waypoint
          : null,
    );
  }
}
