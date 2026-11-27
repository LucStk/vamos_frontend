// scene_composition.dart
import 'package:map_engine/map_engine.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/route/injection/proposal_ways_provider.dart';
import 'package:vamos_cartographie/map/objects/annotations/providers/localization_item_provider.dart';
import 'package:vamos_cartographie/map/objects/annotations/providers/search_result_item_provider.dart';
import 'package:vamos_cartographie/map/objects/pencil/providers/pencil_item_provider.dart';
import 'package:vamos_cartographie/map/objects/sketch_trace/sketch_trace.dart';
import 'package:vamos_cartographie/map/objects/route/route.dart';
import 'package:vamos_cartographie/map/scene/scene_spec.dart';

SceneSpec sketchScene(TripId tripId) => SceneSpec(
  layers: [
    (ref, cam) => [?ref.watch(searchResultItemProvider(cam))],
    (ref, cam) => [?ref.watch(localizationItemProvider(cam))],
    (ref, cam) => [?ref.watch(sketchOriginItemProvider(tripId, cam))],
    (ref, cam) => [?ref.watch(sketchEndItemProvider(tripId, cam))],
    (ref, cam) => [?ref.watch(pencilItemProvider(cam))],
    (ref, cam) => [?ref.watch(sketchTraceItemProvider(false, cam))],
    (ref, cam) => ref.watch(allSegmentItemProvider(tripId, cam)),
  ],
);

SceneSpec sketchGeneratingScene(TripId tripId) => SceneSpec(
  layers: [
    (ref, cam) => [?ref.watch(tripEndItemProvider(tripId, cam))],
    (ref, cam) => [?ref.watch(tripOriginItemProvider(tripId, cam))],
    (ref, cam) => [?ref.watch(sketchTraceItemProvider(true, cam))],
    (ref, cam) => ref.watch(allSegmentItemProvider(tripId, cam)),
  ],
);

/// Route actuelle (dessous) et portion que produirait le tracé (dessus), en
/// style sketch : rien n'est encore ajouté à la route. Le crayon est au bout de
/// l'itinéraire ; le curseur, s'il y en a un, propose d'en générer la suite.
SceneSpec sketchPreviewScene(SketchPreviewing m) => SceneSpec(
  layers: [
    (ref, cam) => [?ref.watch(searchResultItemProvider(cam))],
    (ref, cam) => [?ref.watch(localizationItemProvider(cam))],
    (ref, cam) => [?ref.watch(tripEndItemProvider(m.tripId, cam))],
    (ref, cam) => [?ref.watch(tripOriginItemProvider(m.tripId, cam))],
    (ref, cam) => [?ref.watch(pencilItemProvider(cam))],
    // À vélo, le type de route colore le tracé (arrive après l'aperçu).
    (ref, cam) => sketchRiskItems(
      ref
          .watch(
            proposalWaysProvider((
              tripId: m.tripId,
              proposalId: m.preview.proposalId,
            )),
          )
          .value,
      cam,
    ),
    (ref, cam) => sketchPreviewItems(m.preview, cam, sketchStyle: true),
    (ref, cam) => ref.watch(allSegmentItemProvider(m.tripId, cam)),
  ],
);
