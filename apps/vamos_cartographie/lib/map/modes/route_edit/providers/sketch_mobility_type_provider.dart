import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_application/trip_application.dart';

part 'sketch_mobility_type_provider.g.dart';

/// Type de mobilité choisi pendant le dessin du tracé.
///
/// Partagé entre le panneau d'actions (sélecteur, validation) et, si besoin,
/// la couche carte (couleur du tracé en cours).
///
/// autoDispose : le choix revient à « marche » en quittant le mode sketch.
/// Pour mémoriser le dernier choix, utilise `@Riverpod(keepAlive: true)`.
@riverpod
class SketchMobilityType extends _$SketchMobilityType {
  @override
  MobilityType build() => MobilityType.walk;

  void select(MobilityType type) => state = type;
}
