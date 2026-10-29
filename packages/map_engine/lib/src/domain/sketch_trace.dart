// modes/trip_editor/sketch/sketch_trace.dart
import 'dart:ui';

import 'package:domain_core/space/offset_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:map_engine/src/domain/map_hit.dart';
import 'package:map_engine/src/domain/objects/map_objects.dart';
import 'package:trip_application/trip_application.dart';

part 'sketch_trace.freezed.dart';

/// Une ancre utilisable pendant l'édition d'un tracé.
///
/// - [hit] : rattachement à un élément identifié sur la carte.
/// - [position] : position libre dans le monde cartographique.
@freezed
sealed class SketchAnchor with _$SketchAnchor {
  const SketchAnchor._();
  const factory SketchAnchor(MapHit<RouteElements> hit) = _SketchAnchor;
}

/// Tracé à main levée en cours de saisie, destiné à `editRoute`.
///
/// - [startPoint] : position initiale du crayon, toujours présente.
/// - [startAnchor] : ancre de départ éventuelle.
/// - [endAnchor] : ancre d'arrivée éventuelle.
/// - [points] : points dessinés, dans l'ordre, sans les ancres.
/// - [mobilityType] : `null` signifie hériter de la section raccordée,
///   en priorité celle de départ, puis celle d'arrivée.
///   Pour la première route du trajet, la mobilité est obligatoire.
@freezed
abstract class SketchTrace with _$SketchTrace {
  const SketchTrace._();

  const factory SketchTrace({
    required SketchAnchor startAnchor,
    SketchAnchor? endAnchor,
    MobilityType? mobilityType,
    @Default([]) List<WorldOffset> points,
    @Default(Offset.zero) Offset grabOffset,
  }) = _SketchTrace;

  /// Dernier point effectivement dessiné.
  WorldOffset? get last => points.isEmpty ? null : points.last;

  /// Pointe du crayon : dernier point dessiné, ancre de départ,
  /// ou position initiale si le tracé est libre.
  WorldOffset get tip => last ?? startAnchor.hit.point;

  bool get isCut => points.isEmpty && (endAnchor != null);

  /// Indique si le tracé peut être envoyé au serveur.
  ///
  /// Une première route nécessite des points et une mobilité.
  /// Un tracé raccordé nécessite des points ou deux ancres.
  /// Les coupes sont exclues.
  bool get canSubmit {
    return points.isNotEmpty || endAnchor != null;
  }

  /// Mémorise la position du pointeur relativement à la pointe du crayon.
  SketchTrace grabbedAt(WorldOffset pointer) =>
      copyWith(grabOffset: pointer.value - tip.value);

  /// Ajoute un point en tenant compte du décalage de saisie.
  SketchTrace add(WorldOffset pointer) =>
      copyWith(points: [...points, WorldOffset(pointer.value - grabOffset)]);

  /// Rattache l'arrivée du tracé à une ancre.
  SketchTrace endingAt(SketchAnchor anchor) => copyWith(endAnchor: anchor);

  /// Détache l'arrivée du tracé de la route.
  SketchTrace detached() => copyWith(endAnchor: null);
}
