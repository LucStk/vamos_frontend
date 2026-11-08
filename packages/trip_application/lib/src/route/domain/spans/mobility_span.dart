import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_application/src/route/domain/mobility_types.dart';
import 'package:trip_application/src/route/domain/spans/route_span.dart';

part 'mobility_span.freezed.dart';

/// Calque modalité : ce que l'utilisateur appelle une section. Couvre toute la
/// route. Son id sert d'ancre pour les éditions et de cible pour
/// `refineSection` / `setSectionMobility`.
sealed class MobilitySpanFields implements RouteSpanFields {
  MobilityType get mobilityType;

  /// Plus précis que `SpanId` : c'est la clé de la collection du calque.
  /// Reste utilisable partout où un `SpanId` est attendu (ancres), car
  /// `Id<MobilitySpanFields>` est un sous-type de `Id<RouteSpanFields>`.
  @override
  MobilitySpanId get id;
}

typedef MobilitySpanId = Id<MobilitySpanFields>;

@freezed
abstract class MobilitySpanRemoteModel
    with _$MobilitySpanRemoteModel
    implements MobilitySpanFields {
  const factory MobilitySpanRemoteModel({
    required MobilitySpanId id,
    required int startIndex,
    // Pas de valeur par défaut : le calque est total, le serveur envoie
    // toujours une modalité. Un défaut masquerait un mapping oublié.
    required MobilityType mobilityType,
    double? lengthM,
  }) = _MobilitySpanRemoteModel;

  const MobilitySpanRemoteModel._();

  factory MobilitySpanRemoteModel.fromFields(MobilitySpanFields fields) {
    return MobilitySpanRemoteModel(
      id: fields.id,
      startIndex: fields.startIndex,
      mobilityType: fields.mobilityType,
      lengthM: fields.lengthM,
    );
  }
}

/// Modification optimiste d'un span de modalité : changement de modalité
/// (`setSectionMobility`) ou recalcul en cours (`refineSection`).
///
/// Attention au recalcul : le serveur renvoie le span recalculé avec un NOUVEL
/// id. Réconcilier par `startIndex`, pas par id.
@freezed
abstract class MobilitySpanPatchModel
    with _$MobilitySpanPatchModel
    implements Patch<MobilitySpanRemoteModel>, MobilitySpanFields {
  @Implements<Patch<MobilitySpanRemoteModel>>()
  const factory MobilitySpanPatchModel.internal({
    required MobilitySpanId id,
    required int startIndex,
    required MobilityType mobilityType,
    double? lengthM,
    @Default(false) bool recomputing,
    Object? error,
  }) = _MobilitySpanPatchModel;

  const MobilitySpanPatchModel._();

  factory MobilitySpanPatchModel.fromFields(
    MobilitySpanFields fields, {
    bool recomputing = false,
    Object? error,
  }) {
    return MobilitySpanPatchModel.internal(
      id: fields.id,
      startIndex: fields.startIndex,
      mobilityType: fields.mobilityType,
      lengthM: fields.lengthM,
      recomputing: recomputing,
      error: error,
    );
  }

  factory MobilitySpanPatchModel({
    MobilitySpanId? id,
    required int startIndex,
    required MobilityType mobilityType,
    double? lengthM,
    bool recomputing = false,
    Object? error,
  }) {
    return MobilitySpanPatchModel.internal(
      id: id ?? Id.generate(),
      startIndex: startIndex,
      mobilityType: mobilityType,
      lengthM: lengthM,
      recomputing: recomputing,
      error: error,
    );
  }
}
