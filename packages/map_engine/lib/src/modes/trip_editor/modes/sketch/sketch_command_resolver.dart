import 'package:domain_core/domain/collection_store.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_application/trip_application.dart';

import '/src/domain/camera/map_camera.dart';
import '/src/geometry/merge_polyline.dart';
import '/src/mode_machine/transition.dart';
import '../../map_editor_command.dart';

mixin SketchResolver {
  GraphEditor get graphEditor;
  MapCameraController get camera;
  SegmentFields? segment(SegmentId id) =>
      graphEditor.state.segmentStore.get(id)?.current;
  Future<Object?> resolveSketch(SketchCommand command) => switch (command) {
    CreateSegmentFromSketch c => _create(c),
    SpliceSegment c => _splice(c),
    EditSegmentFromSketch c => _edit(c),
    CorrectSegmentFromSketch c => _correct(c),
    AddPointToSketchSegment c => _project(c),
  };

  Future<SegmentRemoteModel?> _create(CreateSegmentFromSketch c) async {
    final res = await graphEditor.createSegment(
      geometry: c.geometry,
      mobilityType: c.mobilityType,
    );
    return res.fold((_) => null, (d) => d.segment);
  }

  Future<SegmentRemoteModel?> _splice(SpliceSegment c) async {
    final s = segment(c.segmentId);
    if (s == null) return null;
    final res = await graphEditor.spliceSegment(
      correction: c.correction,
      mobilityType: s.mobilityType,
      startAnchor: c.startAnchor,
      endAnchor: c.endAnchor,
    );
    return res.fold((_) => null, (d) => d.$2);
  }

  Future<Done?> _edit(EditSegmentFromSketch c) async =>
      (await graphEditor.updateSegment(
        c.patch,
      )).fold((_) => null, (_) => const Done());

  Future<Done?> _correct(CorrectSegmentFromSketch c) async {
    final s = segment(c.segmentId);
    if (s == null) return null;
    final patch = SegmentPatchModel.fromFields(
      s,
    ).copyWith(geometry: mergeCorrection(c.correction, s.geometry));
    return (await graphEditor.correctSegment(
      patch,
      c.correction,
    )).fold((_) => null, (_) => const Done());
  }

  Future<LatLng?> _project(AddPointToSketchSegment c) async =>
      camera.screenOffsetToLatLng(c.screenOffset);
}
