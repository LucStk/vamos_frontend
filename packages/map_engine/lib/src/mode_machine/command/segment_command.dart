import 'package:domain_core/space/offset_type.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_engine/src/domain/camera/map_camera.dart';
import 'package:map_engine/src/geometry/merge_polyline.dart';
import 'package:map_engine/src/mode_machine/command/command.dart';
import 'package:map_engine/src/mode_machine/command/scopes.dart';
import 'package:map_engine/src/mode_machine/effect/results.dart';
import 'package:trip_application/trip_application.dart';

extension ListWorldOffsetToListLatLng on List<WorldOffset> {
  List<LatLng> toLatLngList(MapCameraReader camera) =>
      map(camera.worldOffsetToLatLng).toList();
}

sealed class SegmentCommand<R extends Object>
    extends Command<R, TopologyScope> {
  const SegmentCommand();
}

final class DeleteSegment extends SegmentCommand<Done> {
  const DeleteSegment(this.segmentId);
  final SectionId segmentId;

  @override
  Future<Done?> handle(TopologyScope h) async {
    await h.graphEditor.deleteSegment(segmentId);
    return const Done();
  }
}

final class ChangeType extends SegmentCommand<Done> {
  const ChangeType({required this.segmentId, required this.type});
  final SectionId segmentId;
  final MobilityType type;

  @override
  Future<Done?> handle(TopologyScope h) async {
    final s = h.segment(segmentId);
    if (s == null) return null;
    await h.graphEditor.updateSegment(
      RouteSectionPatchModel.fromFields(s).copyWith(mobilityType: type),
    );
    return const Done();
  }
}

final class CreateSegmentFromSketch
    extends SegmentCommand<RouteSectionRemoteModel> {
  const CreateSegmentFromSketch({
    required this.geometry,
    required this.mobilityType,
  });
  final List<WorldOffset> geometry;
  final MobilityType mobilityType;

  @override
  Future<RouteSectionRemoteModel?> handle(TopologyScope h) async {
    final res = await h.graphEditor.createSegment(
      geometry: geometry.toLatLngList(h.camera),
      mobilityType: mobilityType,
    );
    return res.fold((_) => null, (d) => d.segment);
  }
}

final class SpliceSegment extends SegmentCommand<SectionId> {
  const SpliceSegment({
    required this.segmentId,
    required this.correction,
    required this.startAnchor,
    required this.endAnchor,
  });
  final SectionId segmentId;
  final List<WorldOffset> correction;
  final SpliceAnchor startAnchor;
  final SpliceAnchor endAnchor;

  @override
  Future<SectionId?> handle(TopologyScope h) async {
    final s = h.segment(segmentId);
    if (s == null) return null;
    final res = await h.graphEditor.spliceSegment(
      correction: correction.toLatLngList(h.camera),
      mobilityType: s.mobilityType,
      startAnchor: startAnchor,
      endAnchor: endAnchor,
    );
    return res.fold((_) => null, (d) => d.$2.id); // voir remarque 1
  }
}

final class EditSegmentFromSketch extends SegmentCommand<Done> {
  const EditSegmentFromSketch(this.patch);
  final RouteSectionPatchModel patch;

  @override
  Future<Done?> handle(TopologyScope h) async =>
      (await h.graphEditor.updateSegment(
        patch,
      )).fold((_) => null, (_) => const Done());
}

final class CorrectSegmentFromSketch extends SegmentCommand<Done> {
  const CorrectSegmentFromSketch({
    required this.segmentId,
    required this.correction,
  });
  final SectionId segmentId;
  final List<WorldOffset> correction;

  @override
  Future<Done?> handle(TopologyScope h) async {
    final s = h.segment(segmentId);
    if (s == null) return null;
    final points = correction.toLatLngList(h.camera);
    final patch = RouteSectionPatchModel.fromFields(
      s,
    ).copyWith(geometry: mergeCorrection(points, s.geometry));
    return (await h.graphEditor.correctSegment(
      patch,
      points,
    )).fold((_) => null, (_) => const Done());
  }
}
