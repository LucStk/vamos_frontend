import 'package:dartz/dartz.dart';
import 'package:domain_core/domain_core.dart';

import 'package:map_engine/src/domain/domain.dart';
import 'package:map_engine/src/mode_engine/mode_engine.dart';
import 'package:map_engine/src/modes/trip_edit/route/commands/route_command.dart';
import 'package:map_engine/src/modes/trip_edit/sketch/slots/sketch_trace.dart';
import 'package:trip_application/trip_application.dart';

sealed class SketchCommand<R extends Object> extends Command<R> {
  const SketchCommand();
}

final class EditRoute extends SketchCommand<Either<Failure, EditRoutePayload>> {
  const EditRoute({
    required this.tripId,
    required this.mobilityType,
    required this.sketch,
    this.autoRoute = true,
  });
  final TripId tripId;
  final MobilityType mobilityType;
  final SketchTrace sketch;

  /// `false` : le tracé à main levée est gardé tel quel, sans routeur.
  final bool autoRoute;

  @override
  Future<Either<Failure, EditRoutePayload>> handle(AppCommandScope h) async => h
      .forTrip(tripId)
      .routeEditor
      .editRoute(
        geometry: sketch.points.toLatLngList(h.camera),
        mobilityType: mobilityType,
        startAnchor: sketch.startAnchor.toRouteAnchor(h.camera),
        endAnchor: sketch.endAnchor?.toRouteAnchor(h.camera),
        autoRoute: autoRoute,
      );
}

/// Calcule l'itinéraire du tracé sans rien ajouter à la route.
final class PreviewSketch
    extends SketchCommand<Either<Failure, PreviewRoutePayload>> {
  const PreviewSketch({
    required this.tripId,
    required this.mobilityType,
    required this.sketch,
  });
  final TripId tripId;
  final MobilityType mobilityType;
  final SketchTrace sketch;

  @override
  Future<Either<Failure, PreviewRoutePayload>> handle(
    AppCommandScope h,
  ) async => h
      .forTrip(tripId)
      .routeEditor
      .previewRouteEdit(
        geometry: sketch.points.toLatLngList(h.camera),
        mobilityType: mobilityType,
        startAnchor: sketch.startAnchor.toRouteAnchor(h.camera),
        endAnchor: sketch.endAnchor?.toRouteAnchor(h.camera),
      );
}

/// Intègre à la route la proposition affichée.
final class CommitSketchPreview
    extends SketchCommand<Either<Failure, EditRoutePayload>> {
  const CommitSketchPreview({required this.tripId, required this.proposalId});
  final TripId tripId;
  final Id proposalId;

  @override
  Future<Either<Failure, EditRoutePayload>> handle(AppCommandScope h) async =>
      h.forTrip(tripId).routeEditor.commitRouteEdit(proposalId: proposalId);
}

/// Abandonne la proposition affichée (retour au tracé).
final class DiscardSketchPreview extends SketchCommand<Done> {
  const DiscardSketchPreview({required this.tripId});
  final TripId tripId;

  @override
  Future<Done?> handle(AppCommandScope h) =>
      done(() => h.forTrip(tripId).routeEditor.discardRouteProposal());
}
