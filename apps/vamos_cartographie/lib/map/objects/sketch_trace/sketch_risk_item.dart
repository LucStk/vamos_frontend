import 'dart:ui';

import 'package:domain_core/domain_core.dart';
import 'package:flutter/material.dart' show Colors;
import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:trip_application/trip_application.dart';

/// Catégorie d'un tronçon pour juger du danger de la route : une piste
/// cyclable séparée prime sur le type de voie qu'elle longe.
String wayRiskKey(WaySpan span) =>
    span.cycle == 'separated' ? 'separated' : span.kind;

/// Du vert (voie vélo) au rouge sombre (voie rapide) ; le gris : nature
/// inconnue. Une clé inconnue du client est grise aussi.
Color wayRiskColor(String key) => switch (key) {
  'separated' || 'cycleway' => Colors.green.shade600,
  'path' || 'steps' || 'mountain_bike' => Colors.teal.shade600,
  'track' => Colors.brown.shade400,
  'local' || 'service' => Colors.lightBlue.shade400,
  'tertiary' => Colors.amber.shade600,
  'secondary' => Colors.orange.shade500,
  'primary' => Colors.deepOrange.shade400,
  'motorway' || 'trunk' => Colors.red.shade800,
  _ => Colors.grey.shade500,
};

/// Un tronçon de l'itinéraire prévisualisé, coloré selon le type de route, par-
/// dessus le tracé hachuré. Rien à toucher dessus.
final class SketchRiskItem extends LineItem {
  SketchRiskItem({required this.worldSegments, required this.color});

  @override
  final MapSketchSegment object = const MapSketchSegment();

  @override
  final List<WorldSegment> worldSegments;

  final Color color;

  @override
  bool get isHitTestable => false;

  // Plus fin que le tracé (5 px) : les hachures restent lisibles de chaque côté.
  @override
  ScreenLength get visualRadius => 2.px;

  @override
  ScreenLength get hitRadius => 0.px;

  @override
  DrawCommand toDrawCommand({
    MapPaintContext context = const MapPaintContext(),
  }) => DrawPath(
    path: path,
    style: Stroke(
      color,
      width: 4.px,
      cap: StrokeCap.round,
      join: StrokeJoin.round,
    ),
  );
}

List<SketchRiskItem> sketchRiskItems(
  List<WaySpan>? spans,
  MapCameraReader camera,
) => [
  for (final s in spans ?? const <WaySpan>[])
    if (s.coordinates.length >= 2)
      SketchRiskItem(
        worldSegments: projectLine(
          s.coordinates,
          camera.latLngToWorldOffset,
        ),
        color: wayRiskColor(wayRiskKey(s)),
      ),
];
