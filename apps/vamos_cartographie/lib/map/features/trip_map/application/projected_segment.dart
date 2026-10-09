import 'dart:ui';

import 'package:map_canvas/map_canvas.dart';
import "package:map_engine/map_engine.dart";

import 'package:vamos_cartographie/domain_features/domain_features.dart';

/// Apparence "de base" d'un segment, indépendante de l'état visuel.
/// Pur data : aucune dépendance à Flutter Material ni à trip_application.
final class SegmentAppearance {
  const SegmentAppearance({required this.color, this.dash});

  final Color color;

  /// Motif de pointillés en pixels écran : [trait, vide, trait, vide...].
  /// null = trait plein.
  final List<double>? dash;

  static const fallback = SegmentAppearance(color: Color(0xFF9E9E9E));
}

extension MobilityTypeSegmentAppearance on MobilityTypeStyle {
  SegmentAppearance get segmentAppearance => SegmentAppearance(
    color: Color(colorValue),
    dash: isDashed ? const [10, 7] : null,
  );
}

/// Look d'un segment dans un état donné (tout est interpolable).
class _Look {
  const _Look({
    required this.width, // épaisseur du trait principal (px)
    required this.casing, // liseré clair de chaque côté (px)
    required this.halo, // épaisseur ajoutée pour le halo (px), 0 = pas de halo
    required this.lift, // 0..1 : éclaircissement de la couleur vers le blanc
  });

  final double width, casing, halo, lift;

  static _Look lerp(_Look a, _Look b, double t) => _Look(
    width: lerpDouble(a.width, b.width, t)!,
    casing: lerpDouble(a.casing, b.casing, t)!,
    halo: lerpDouble(a.halo, b.halo, t)!,
    lift: lerpDouble(a.lift, b.lift, t)!,
  );
}

final class ProjectedSegment extends ProjectedLine<MapSegment> {
  ProjectedSegment({
    required super.object,
    required super.worldSegments,
    this.appearance = SegmentAppearance.fallback,
  });

  final SegmentAppearance appearance;

  static const _looks = <MapObjectVisualState, _Look>{
    MapObjectVisualState.normal: _Look(
      width: 6.5,
      casing: 1.5,
      halo: 0,
      lift: 0,
    ),
    MapObjectVisualState.hovered: _Look(
      width: 5,
      casing: 1.5,
      halo: 5,
      lift: 0.15,
    ),
    MapObjectVisualState.selected: _Look(
      width: 9,
      casing: 2,
      halo: 12,
      lift: 0,
    ),
    MapObjectVisualState.dragging: _Look(
      width: 7,
      casing: 2,
      halo: 16,
      lift: 0.2,
    ),
  };

  static const _casingColor = Color(0xD9FFFFFF); // blanc ~85 %
  static const _white = Color(0xFFFFFFFF);

  @override
  MapDrawCommand describe({MapPaintContext context = const MapPaintContext()}) {
    final path = this.path;
    final look = _Look.lerp(
      _looks[context.from]!,
      _looks[context.state]!,
      context.t,
    );

    final dash = appearance.dash;
    // Les pointillés en cap rond "bavent" et changent de motif quand
    // l'épaisseur s'anime : on force un cap plat pour eux.
    final cap = dash == null ? StrokeCap.round : StrokeCap.butt;

    Paint stroke(Color color, double width) => Paint()
      ..style = PaintingStyle.stroke
      ..color = color
      ..strokeWidth = width
      ..strokeCap = cap
      ..strokeJoin = StrokeJoin.round;

    final mainColor = Color.lerp(appearance.color, _white, look.lift)!;

    return ScreenScale([
      // 1. Halo : toujours plein, même pour un segment pointillé
      //    (il se lit comme une surbrillance de tout le trajet).
      if (look.halo > 0.1)
        DrawPath(
          path: path,
          paint: stroke(
            appearance.color.withValues(alpha: 0.30),
            look.width + look.casing * 2 + look.halo,
          ),
        ),
      // 2. Liseré : décolle le trait du fond de carte.
      //    Pointillé aussi, sinon il comblerait les vides.
      DrawPath(
        path: path,
        paint: stroke(_casingColor, look.width + look.casing * 2),
        dash: dash,
      ),
      // 3. Trait principal
      DrawPath(path: path, paint: stroke(mainColor, look.width), dash: dash),
    ]);
  }
}
