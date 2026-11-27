import 'package:domain_core/domain_core.dart';
import 'package:flutter/widgets.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/objects/route/segment/appearance/segment_appearance.dart';
import 'package:vamos_cartographie/map/objects/route/segment/geometry/rounded_polyline.dart';
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
    this.aura = false,
    this.auraSpanId,
    this.context = const MapPaintContext(),
  });

  /// Ce jour est le jour sélectionné : il porte une aura grise, à la place du
  /// look « sélectionné » ordinaire. Quand un autre jour est sélectionné,
  /// celui-ci s'efface par le trait `dimmed`, donné par la scène.
  final bool aura;

  /// Morceau (span) sélectionné dans ce jour : lui seul porte l'aura. Null :
  /// aucun morceau choisi, tout le jour l'a.
  final SpanId? auraSpanId;

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

  /// Aura de sélection : grise, plus large que le liseré.
  static const _auraColor = Color(0x66757575);
  static const _auraExtra = 14.0;

  late final List<Path> _paths = [
    for (final r in runs)
      roundedPolylinePath(r.worldSegments, radius: _cornerRadius),
  ];

  @override
  DrawCommand toDrawCommand({
    MapPaintContext context = const MapPaintContext(),
  }) {
    // L'aura remplace l'effet « sélectionné » (plus épais, halo coloré).
    final look = SegmentStyle.resolver.resolve(
      aura
          ? MapPaintContext(
              weights: context.weights.without(VisualTrait.selected),
              time: context.time,
            )
          : context,
    );
    final auraWidth =
        visualRadius.value * 2 * look.widthScale +
        look.casing * 2 +
        _auraExtra;
    final auras = [
      for (var i = 0; i < runs.length; i++)
        if (aura && (auraSpanId == null || runs[i].spanId == auraSpanId))
          DrawPath(
            path: _paths[i],
            style: Stroke(
              _auraColor,
              width: auraWidth.px,
              cap: StrokeCap.round,
              join: StrokeJoin.round,
            ),
          ),
    ];
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
      ...auras,
      for (final l in layers)
        if (l.halo != null) l.halo!,
      for (final l in layers) l.casing,
      for (final l in layers) l.main,
    ]);
  }
}
