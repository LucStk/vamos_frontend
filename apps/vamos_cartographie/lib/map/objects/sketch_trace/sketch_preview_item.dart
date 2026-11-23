import 'package:domain_core/domain_core.dart';
import 'package:map_canvas/map_canvas.dart';
import 'package:map_engine/map_engine.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/objects/route/segment/appearance/mobility_appearance.dart';
import 'package:vamos_cartographie/map/objects/route/segment/style/segment_style.dart';

/// Un tronçon de l'itinéraire prévisualisé, dessiné comme une section de la
/// route (couleur de sa mobilité). Rien à toucher dessus : `SketchPreviewing`
/// ignore les gestes.
final class SketchPreviewItem extends LineItem {
  SketchPreviewItem({required this.worldSegments, required this.mobilityType});

  @override
  final MapSketchSegment object = const MapSketchSegment();

  @override
  final List<WorldSegment> worldSegments;

  final MobilityType mobilityType;

  /// Même épaisseur qu'une section de la route.
  @override
  ScreenLength get visualRadius => 3.25.px;

  @override
  ScreenLength get hitRadius => 14.px;

  @override
  DrawCommand toDrawCommand({
    MapPaintContext context = const MapPaintContext(),
  }) => SegmentStyle.build(
    path,
    MobilityAppearances.of(mobilityType),
    SegmentStyle.resolver.resolve(context),
    radius: visualRadius,
  );
}

/// Portions de [preview] produites par le tracé (`isNew`), une par couple
/// (mobilité, édition). Le reste de la route est déjà à l'écran.
List<SketchPreviewItem> sketchPreviewItems(
  PreviewRoutePayload preview,
  MapCameraReader camera,
) {
  final coords = preview.coordinates;
  if (coords.length < 2) return const [];
  final last = coords.length - 1;

  final mobility = [...preview.mobilitySpans]
    ..sort((a, b) => a.startIndex.compareTo(b.startIndex));
  final edits = [...preview.editSpans]
    ..sort((a, b) => a.startIndex.compareTo(b.startIndex));

  // Un span court jusqu'au début du suivant : chaque borne est une coupure.
  final cuts = {
    0,
    last,
    for (final s in mobility) s.startIndex,
    for (final s in edits) s.startIndex,
  }.where((i) => i >= 0 && i <= last).toList()..sort();

  final items = <SketchPreviewItem>[];
  for (var i = 0; i < cuts.length - 1; i++) {
    final from = cuts[i];
    final to = cuts[i + 1];
    final edit = edits.lastWhereOrNull((s) => s.startIndex <= from);
    final mobilityType = mobility
        .lastWhereOrNull((s) => s.startIndex <= from)
        ?.mobilityType;
    if (edit == null || !edit.isNew || mobilityType == null) continue;

    items.add(
      SketchPreviewItem(
        worldSegments: projectLine(
          coords.sublist(from, to + 1),
          camera.latLngToWorldOffset,
        ),
        mobilityType: mobilityType,
      ),
    );
  }
  return items;
}

extension _LastWhereOrNull<T> on List<T> {
  T? lastWhereOrNull(bool Function(T) test) {
    for (var i = length - 1; i >= 0; i--) {
      if (test(this[i])) return this[i];
    }
    return null;
  }
}
