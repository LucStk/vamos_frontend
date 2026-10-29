// modes/trip_editor/sketch/sketch_trace.dart
import 'dart:ui';

import 'package:domain_core/space/offset_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trip_application/trip_application.dart';

part 'sketch_trace.freezed.dart';

/// Tracé à main levé en cours de saisie, tel qu'il sera envoyé à `editRoute`.
///
/// Même contrat que le serveur :
/// - [points] : ordre du dessin, SANS les ancres. Le tracé part de
///   [startAnchor] (ou d'un point libre) et arrive à [endAnchor] (ou à un
///   point libre). Le serveur retourne lui-même les points quand il faut.
/// - [startAnchor] / [endAnchor] : où le tracé touche la route existante.
///   Sans route, aucune des deux.
/// - [mobilityType] : `null` = hériter de la section de [startAnchor] (à défaut
///   [endAnchor]). Obligatoire pour la première route d'un trip.
@freezed
abstract class SketchTrace with _$SketchTrace {
  const SketchTrace._();

  const factory SketchTrace(
    List<WorldOffset> points, {
    RouteAnchor? startAnchor,
    RouteAnchor? endAnchor,
    MobilityType? mobilityType,

    /// Écart (monde) entre le pointeur et la pointe du crayon au moment de la saisie.
    @Default(Offset.zero) Offset grabOffset,
  }) = _SketchTrace;

  /// Tracé vide, sans ancre : le départ sera un point libre (la fin pourra
  /// ensuite être posée sur la route avec [endingAt]).
  factory SketchTrace.empty() => const SketchTrace([]);

  /// Première route d'un trip : pas d'ancre, la mobilité est obligatoire.
  factory SketchTrace.firstRoute({
    MobilityType mobilityType = MobilityType.bike,
  }) => SketchTrace(const [], mobilityType: mobilityType);

  /// Tracé qui part de [startAnchor]. [points] reste vide : l'ancre n'en fait
  /// PAS partie (la dupliquer ferait un doublon côté serveur).
  factory SketchTrace.fromStartAnchor(RouteAnchor startAnchor) =>
      SketchTrace(const [], startAnchor: startAnchor);

  /// Dernier point dessiné.
  WorldOffset? get last => points.isEmpty ? null : points.last;

  /// Pointe du crayon : le dernier point dessiné ou, tant qu'on n'a rien
  /// dessiné, l'ancre de départ.
  WorldOffset? get tip => last ?? startAnchor?.position;

  bool get hasAnchor => startAnchor != null || endAnchor != null;

  /// Une seule ancre et aucun point : pour le serveur c'est une COUPE (la fin
  /// ou le début de la route est supprimé). Ne jamais l'envoyer comme simple
  /// effet d'un geste vide : seulement sur une action explicite de l'utilisateur.
  bool get isCut =>
      points.isEmpty && (startAnchor != null) != (endAnchor != null);

  /// Peut être envoyé comme un tracé : première route (points + mobilité), ou
  /// ancres avec des points, ou deux ancres (recalcul entre elles). Les coupes
  /// ([isCut]) sont exclues.
  bool get canSubmit {
    if (!hasAnchor) return points.isNotEmpty && mobilityType != null;
    return points.isNotEmpty || (startAnchor != null && endAnchor != null);
  }

  /// Mémorise où le crayon a été saisi, par rapport à sa pointe.
  SketchTrace grabbedAt(WorldOffset pointer) {
    final t = tip;
    return copyWith(
      grabOffset: t == null ? Offset.zero : pointer.value - t.value,
    );
  }

  /// [pointer] est la position du pointeur ; la pointe est placée à
  /// `pointer - grabOffset`.
  SketchTrace add(WorldOffset pointer) =>
      copyWith(points: [...points, WorldOffset(pointer.value - grabOffset)]);

  /// Le tracé rejoint la route en [anchor].
  SketchTrace endingAt(RouteAnchor anchor) => copyWith(endAnchor: anchor);

  /// Le tracé ne rejoint plus la route (le pointeur s'en est éloigné).
  SketchTrace detached() => copyWith(endAnchor: null);
}
