import 'package:domain_core/space/offset_type.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_engine/src/domain/camera/map_camera.dart';
import 'package:map_engine/src/mode_machine/command/command.dart';

extension ListWorldOffsetToListLatLng on List<WorldOffset> {
  List<LatLng> toLatLngList(MapCameraReader camera) =>
      map(camera.worldOffsetToLatLng).toList();
}

sealed class RouteCommand<R extends Object> extends Command<R> {
  const RouteCommand();
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
//
// final class CreateRouteFromSketch
//     extends RouteCommand<RouteSectionRemoteModel> {
//   const CreateRouteFromSketch({
//     required this.geometry,
//     required this.mobilityType,
//   });
//   final List<WorldOffset> geometry;
//   final MobilityType mobilityType;
//
//   @override
//   Future<RouteSectionRemoteModel?> handle(TripEditScope h) async {
//     final res = await h.routeEditor.createRoute(
//       geometry: geometry.toLatLngList(h.camera),
//       mobilityType: mobilityType,
//     );
//     return res.fold((_) => null, (d) => d.section);
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
