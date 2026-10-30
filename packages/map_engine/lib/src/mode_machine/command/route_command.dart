import 'package:dartz/dartz.dart';
import 'package:domain_core/failures.dart';
import 'package:domain_core/space/offset_type.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_engine/src/domain/camera/map_camera.dart';
import 'package:map_engine/src/domain/objects/map_objects.dart';
import 'package:map_engine/src/domain/sketch_trace.dart';
import 'package:map_engine/src/mode_machine/app_scope.dart';
import 'package:map_engine/src/mode_machine/command/command.dart';
import 'package:trip_application/trip_application.dart';

extension ListWorldOffsetToListLatLng on List<WorldOffset> {
  List<LatLng> toLatLngList(MapCameraReader camera) =>
      map(camera.worldOffsetToLatLng).toList();
}

sealed class RouteCommand<R extends Object> extends Command<R> {
  const RouteCommand();
}

final class EditRoute extends RouteCommand<Either<Failure, EditRoutePayload>> {
  const EditRoute({required this.tripId, required this.sketch});
  final TripId tripId;
  final SketchTrace sketch;

  @override
  Future<Either<Failure, EditRoutePayload>> handle(AppCommandScope h) async {
    final geometry = sketch.points.toLatLngList(h.camera);

    final startHit = sketch.startAnchor.hit;
    final startAnchor = startHit.object.toRouteAnchor(
      h.camera.worldOffsetToLatLng(startHit.point),
    );

    final endHit = sketch.endAnchor?.hit;
    final endAnchor = endHit?.object.toRouteAnchor(
      h.camera.worldOffsetToLatLng(endHit.point),
    );

    return h
        .forTrip(tripId)
        .routeEditor
        .editRoute(
          geometry: geometry,
          mobilityType: sketch.mobilityType,
          startAnchor: startAnchor,
          endAnchor: endAnchor,
        );
  }
}

final class DeleteRoute
    extends RouteCommand<Either<Failure, EditRoutePayload>> {
  const DeleteRoute({required this.tripId});
  final TripId tripId;

  @override
  Future<Either<Failure, EditRoutePayload>> handle(AppCommandScope h) async {
    return await h.forTrip(tripId).routeEditor.deleteRoute(tripId: tripId);
  }
}
//
// final class DeleteSection extends RouteCommand<Done> {
//   const DeleteSection(this.sectionId);
//   final SectionId sectionId;
//
//   @override
//   Future<Done?> handle(TripEditScope h) async {
//     await h.routeEditor.deleteRoute(sectionId);
//     return const Done();
//   }
// }
//
// final class ChangeType extends RouteCommand<Done> {
//   const ChangeType({required this.sectionId, required this.type});
//   final SectionId sectionId;
//   final MobilityType type;
//
//   @override
//   Future<Done?> handle(TripEditScope h) async {
//     final s = h.section(sectionId);
//     if (s == null) return null;
//     await h.routeEditor.updateRoute(
//       RouteSectionPatchModel.fromFields(s).copyWith(mobilityType: type),
//     );
//     return const Done();
//   }
// }

// final class SpliceRoute extends RouteCommand<SectionId> {
//   const SpliceRoute({
//     required this.sectionId,
//     required this.correction,
//     required this.startAnchor,
//     required this.endAnchor,
//   });
//   final SectionId sectionId;
//   final List<WorldOffset> correction;
//   final SpliceAnchor startAnchor;
//   final SpliceAnchor endAnchor;
//
//   @override
//   Future<SectionId?> handle(TopologyScope h) async {
//     final s = h.section(sectionId);
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

// final class EditRouteFromSketch extends RouteCommand<Done> {
//   const EditRouteFromSketch(this.patch);
//   final RouteSectionPatchModel patch;
//
//   @override
//   Future<Done?> handle(TripEditScope h) async =>
//       (await h.routeEditor.updateRoute(
//         patch,
//       )).fold((_) => null, (_) => const Done());
// }
//
// final class CorrectRouteFromSketch extends RouteCommand<Done> {
//   const CorrectRouteFromSketch({
//     required this.sectionId,
//     required this.correction,
//   });
//   final SectionId sectionId;
//   final List<WorldOffset> correction;
//
//   @override
//   Future<Done?> handle(TripEditScope h) async {
//     final s = h.section(sectionId);
//     if (s == null) return null;
//     final points = correction.toLatLngList(h.camera);
//     final patch = RouteSectionPatchModel.fromFields(
//       s,
//     ).copyWith(geometry: mergeCorrection(points, s.geometry));
//     return (await h.routeEditor.correctRoute(
//       patch,
//       points,
//     )).fold((_) => null, (_) => const Done());
//   }
// }
