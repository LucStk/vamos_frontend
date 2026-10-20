import 'package:domain_core/space/offset_type.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_engine/src/domain/camera/map_camera.dart';
import 'package:map_engine/src/geometry/merge_polyline.dart';
import 'package:map_engine/src/mode_machine/command/command.dart';
import 'package:map_engine/src/mode_machine/command/effect/results.dart';
import 'package:map_engine/src/mode_machine/command/scopes.dart';
import 'package:trip_application/trip_application.dart';

extension ListWorldOffsetToListLatLng on List<WorldOffset> {
  List<LatLng> toLatLngList(MapCameraReader camera) =>
      map(camera.worldOffsetToLatLng).toList();
}

sealed class RouteCommand<R extends Object> extends Command<R, TripEditScope> {
  const RouteCommand();
}

final class DeleteRoute extends RouteCommand<Done> {
  const DeleteRoute(this.segmentId);
  final SectionId segmentId;

  @override
  Future<Done?> handle(TripEditScope h) async {
    await h.routeEditor.deleteRoute(segmentId);
    return const Done();
  }
}

final class ChangeType extends RouteCommand<Done> {
  const ChangeType({required this.segmentId, required this.type});
  final SectionId segmentId;
  final MobilityType type;

  @override
  Future<Done?> handle(TripEditScope h) async {
    final s = h.segment(segmentId);
    if (s == null) return null;
    await h.routeEditor.updateRoute(
      RouteSectionPatchModel.fromFields(s).copyWith(mobilityType: type),
    );
    return const Done();
  }
}

final class CreateRouteFromSketch
    extends RouteCommand<RouteSectionRemoteModel> {
  const CreateRouteFromSketch({
    required this.geometry,
    required this.mobilityType,
  });
  final List<WorldOffset> geometry;
  final MobilityType mobilityType;

  @override
  Future<RouteSectionRemoteModel?> handle(TripEditScope h) async {
    final res = await h.routeEditor.createRoute(
      geometry: geometry.toLatLngList(h.camera),
      mobilityType: mobilityType,
    );
    return res.fold((_) => null, (d) => d.segment);
  }
}

// final class SpliceRoute extends RouteCommand<SectionId> {
//   const SpliceRoute({
//     required this.segmentId,
//     required this.correction,
//     required this.startAnchor,
//     required this.endAnchor,
//   });
//   final SectionId segmentId;
//   final List<WorldOffset> correction;
//   final SpliceAnchor startAnchor;
//   final SpliceAnchor endAnchor;
//
//   @override
//   Future<SectionId?> handle(TopologyScope h) async {
//     final s = h.segment(segmentId);
//     if (s == null) return null;
//     final res = await h.graphEditor.spliceRoute(
//       correction: correction.toLatLngList(h.camera),
//       mobilityType: s.mobilityType,
//       startAnchor: startAnchor,
//       endAnchor: endAnchor,
//     );
//     return res.fold((_) => null, (d) => d.$2.id); // voir remarque 1
//   }
// }

final class EditRouteFromSketch extends RouteCommand<Done> {
  const EditRouteFromSketch(this.patch);
  final RouteSectionPatchModel patch;

  @override
  Future<Done?> handle(TripEditScope h) async =>
      (await h.routeEditor.updateRoute(
        patch,
      )).fold((_) => null, (_) => const Done());
}

final class CorrectRouteFromSketch extends RouteCommand<Done> {
  const CorrectRouteFromSketch({
    required this.segmentId,
    required this.correction,
  });
  final SectionId segmentId;
  final List<WorldOffset> correction;

  @override
  Future<Done?> handle(TripEditScope h) async {
    final s = h.segment(segmentId);
    if (s == null) return null;
    final points = correction.toLatLngList(h.camera);
    final patch = RouteSectionPatchModel.fromFields(
      s,
    ).copyWith(geometry: mergeCorrection(points, s.geometry));
    return (await h.routeEditor.correctRoute(
      patch,
      points,
    )).fold((_) => null, (_) => const Done());
  }
}
