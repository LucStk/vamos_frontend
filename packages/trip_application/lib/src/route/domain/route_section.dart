import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain_core/domain_core.dart';
import 'package:trip_application/src/route/domain/mobility_types.dart';

part 'route_section.freezed.dart';

sealed class RouteSectionFields implements HasId {
  MobilityType get mobilityType;
  int get startIndex;
  @override
  Id<RouteSectionFields> get id;
}

typedef SectionId = Id<RouteSectionFields>;

@freezed
abstract class RouteSectionRemoteModel
    with _$RouteSectionRemoteModel
    implements RouteSectionFields {
  const factory RouteSectionRemoteModel({
    required SectionId id,
    required int startIndex,
    @Default(MobilityType.bike) MobilityType mobilityType,
  }) = _RouteSectionRemoteModel;

  const RouteSectionRemoteModel._();

  factory RouteSectionRemoteModel.fromFields(RouteSectionFields fields) {
    return RouteSectionRemoteModel(
      id: fields.id,
      startIndex: fields.startIndex,
      mobilityType: fields.mobilityType,
    );
  }
}

@freezed
abstract class RouteSectionPatchModel
    with _$RouteSectionPatchModel
    implements Patch<RouteSectionRemoteModel>, RouteSectionFields {
  @Implements<Patch<RouteSectionRemoteModel>>()
  const factory RouteSectionPatchModel.internal({
    required SectionId id,
    required int startIndex,
    @Default(MobilityType.bike) MobilityType mobilityType,
    @Default(false) bool recomputing,
    Object? error,
  }) = _RouteSectionPatchModel;

  const RouteSectionPatchModel._();

  factory RouteSectionPatchModel.fromFields(
    RouteSectionFields fields, {
    bool recomputing = false,
    Object? error,
  }) {
    return RouteSectionPatchModel.internal(
      id: fields.id,
      startIndex: fields.startIndex,
      mobilityType: fields.mobilityType,
      recomputing: recomputing,
      error: error,
    );
  }

  factory RouteSectionPatchModel({
    SectionId? id,
    required int startIndex,
    bool recomputing = false,
    Object? error,
    MobilityType mobilityType = MobilityType.bike,
  }) {
    return RouteSectionPatchModel.internal(
      id: id ?? Id.generate(),
      startIndex: startIndex,
      recomputing: recomputing,
      error: error,
      mobilityType: mobilityType,
    );
  }
}
