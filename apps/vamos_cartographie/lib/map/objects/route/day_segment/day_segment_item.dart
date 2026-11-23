import 'package:domain_core/domain_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/objects/route/segment/appearance/segment_appearance.dart';
import 'package:vamos_cartographie/map/objects/route/segment/geometry/rounded_polyline.dart';
import 'package:vamos_cartographie/map/objects/route/segment/style/segment_look.dart';
import 'package:vamos_cartographie/map/objects/route/segment/style/segment_style.dart';

// + vos imports habituels : route_store, route_polyline_provider,
//   mobilitySpanProvider, MobilityAppearances, sliceBetween, projectLine...

/// Un tronçon de modalité à l'intérieur d'un jour : sa couleur et sa géométrie,
/// avec son span et sa place sur la route (pour savoir lequel on touche).
typedef DayRunGeometry = ({
  SegmentAppearance appearance,
  List<WorldSegment> worldSegments,
  SpanId spanId,
  ({double from, double to}) range,
});

/// Un jour de la route, éventuellement multicolore (une couleur par modalité
/// traversée). Un seul item, un seul `object` : le survol, la sélection et le
/// glissement s'appliquent au jour entier.
final class DaySegmentItem extends LineItem {
  DaySegmentItem({
    required this.object,
    required this.runs,
    required this.polyline,
    this.dimmed = false,
    this.context = const MapPaintContext(),
  });

  /// Un autre jour est sélectionné : celui-ci s'efface (éclairci, sans halo).
  final bool dimmed;

  final List<DayRunGeometry> runs;
  final RoutePolyline polyline;
  final MapPaintContext context;

  @override
  final MapDaySegment object;

  /// Tout le jour, pour le hit-test : la continuité entre tronçons importe
  /// peu, seule la distance au tracé compte.
  @override
  late final List<WorldSegment> worldSegments = [
    for (final r in runs) ...r.worldSegments,
  ];

  @override
  ScreenLength get visualRadius => 3.25.px;

  @override
  ScreenLength get hitRadius => 14.px;

  /// Position sur la route et morceau touché : le premier dont la fin dépasse
  /// la position, à défaut le dernier (la projection peut déborder un peu).
  @override
  HitDetail? hitDetail(WorldOffset p) {
    final position = polyline.project(p);
    if (runs.isEmpty) return RouteHitDetail(position);
    final run = runs.firstWhere(
      (r) => position <= r.range.to,
      orElse: () => runs.last,
    );
    return DayRunHitDetail(position, run.spanId);
  }

  @override
  DragDetail? dragDetail(WorldOffset p) => RouteDragDetail(polyline.project(p));

  static const _cornerRadius = 12.0; // même valeur que SegmentItem

  /// Éclaircissement (vers le blanc) d'un jour écarté par la sélection.
  static const _dimLift = 0.6;

  late final List<Path> _paths = [
    for (final r in runs)
      roundedPolylinePath(r.worldSegments, radius: _cornerRadius),
  ];

  @override
  DrawCommand toDrawCommand({
    MapPaintContext context = const MapPaintContext(),
  }) {
    final resolved = SegmentStyle.resolver.resolve(context);
    final look = dimmed
        ? SegmentLook(
            widthScale: resolved.widthScale,
            casing: resolved.casing,
            halo: 0,
            lift: _dimLift,
          )
        : resolved;
    final layers = [
      for (var i = 0; i < runs.length; i++)
        SegmentStyle.layers(
          _paths[i],
          runs[i].appearance,
          look,
          radius: visualRadius,
        ),
    ];

    // Couche par couche : tous les halos, puis tous les liserés, puis tous
    // les traits. Aucun liseré ne vient donc couper le trait d'un tronçon
    // voisin, et la jonction entre deux couleurs reste nette.
    return DrawGroup([
      for (final l in layers)
        if (l.halo != null) l.halo!,
      for (final l in layers) l.casing,
      for (final l in layers) l.main,
    ]);
  }
}
