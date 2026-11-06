// objects/segment/badge/mobility_badge_item.dart
import 'package:domain_core/space/offset_type.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:vamos_cartographie/map/objects/route/segment/appearance/segment_appearance.dart';
import 'package:vamos_cartographie/map/objects/route/segment/badge/mobility_badge_style.dart';

final class MobilityBadgeItem extends PointItem {
  MobilityBadgeItem({
    required this.object,
    required this.worldPosition,
    required this.appearance,
    required this.glyph,
  });

  @override
  final MobilityBadge object;

  @override
  final WorldOffset worldPosition;

  /// Partagée avec la ligne : même source de vérité, la table des
  /// modalités. Construite par le provider, pas déduite ici.
  final SegmentAppearance appearance;

  final IconGlyph glyph;

  /// Rayon de la pastille au repos. Doit rester égal à
  /// `MobilityBadgeStyle._radius`.
  @override
  ScreenLength get visualRadius => 11.px;

  /// Plus large que le visuel : une cible de 22 px de diamètre est en
  /// dessous du minimum tactile confortable.
  @override
  ScreenLength get hitRadius => 18.px;

  @override
  DrawCommand toDrawCommand({
    MapPaintContext context = const MapPaintContext(),
  }) => MobilityBadgeStyle.build(
    worldPosition,
    appearance,
    glyph,
    MobilityBadgeStyle.resolver.resolve(context),
  );
}
