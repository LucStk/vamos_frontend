import 'package:dartz/dartz.dart' hide id;
import 'package:domain_core/domain_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/core/mappers/geometry_mappers/bounds_mapper.dart';
import 'package:vamos_cartographie/core/mappers/geometry_mappers/position_mapper.dart';
import 'package:vamos_cartographie/core/graphql/__generated__/schema.schema.gql.dart';
import 'package:vamos_cartographie/domain_features/route/data/graphql/graphql.dart';
import 'package:vamos_cartographie/domain_features/route/data/mappers/geometry_source_mapper.dart';
import 'package:vamos_cartographie/domain_features/route/data/mappers/mobility_type_mapper.dart';
import 'package:vamos_cartographie/domain_features/route/data/route_failures.dart';

extension RouteSectionMapper on GMobilitySpan {
  MobilitySpanRemoteModel toMobilityDomain() => MobilitySpanRemoteModel(
    id: MobilitySpanId(id),
    startIndex: startIndex,
    mobilityType: mobilityType.toMobilityDomain(),
  );
}

extension EditSpanMapper on GEditSpan {
  EditSpan toEditSpanDomain() => EditSpan(
    id: MobilitySpanId(id),
    startIndex: startIndex,
    editId: EditId(editId),
    lengthM: lengthM,
    geometrySource: geometrySource.toGeometrySourceDomain(),
  );
}

extension GTripRouteEditingMapper on GTripRouteEditing {
  RouteRemoteModel toRouteModel() => RouteRemoteModel(
    geometry: route.map((m) => m.toLatLng()).toList(),
    startPoint: startPoint.toLatLng(),
    id: TripId(id),
    bounds: bounds?.toMapBounds(),
  );
  EditRoutePayload toEditRoutePayload() => EditRoutePayload(
    route: toRouteModel(),
    editSpans: editSpans.map((m) => m.toEditSpanDomain()),
    mobilitySpans: mobilitySpans.map((m) => m.toMobilityDomain()),
  );
}

extension GEditRouteResultMapper on GEditRouteResult {
  Either<RouteEditFailure, EditRoutePayload> toDomain() => switch (this) {
    final GEditRouteResult__asEditRouteSuccess s => Right(
      s.trip.toEditRoutePayload(),
    ),
    final GEditRouteResult__asEditRouteError e => Left(
      routeEditFailureFor(e.code, e.message),
    ),
    _ => Left(UnknownRouteEditFailure(code: G__typename)),
  };
}

extension GPreviewEditSpanMapper on GPreviewEditSpan {
  PreviewEditSpan toDomain() => PreviewEditSpan(
    isNew: isNew,
    editId: EditId(editId),
    id: (id != null) ? Id(id!) : null,
    startIndex: startIndex,
    geometrySource: geometrySource.toGeometrySourceDomain(),
  );
}

extension GPreviewMobilitySpanMapper on GPreviewMobilitySpan {
  PreviewMobilitySpan toDomain() => PreviewMobilitySpan(
    id: (id != null) ? Id(id!) : null,
    startIndex: startIndex,
    mobilityType: mobilityType.toMobilityDomain(),
  );
}

extension GRoutePreviewResultMapper on GRoutePreviewResult {
  Either<RouteEditFailure, PreviewRoutePayload> toDomain() => switch (this) {
    GRoutePreviewResultData__asRoutePreviewSuccess e => Right(
      PreviewRoutePayload(
        coordinates: e.coordinates.toDomain(),
        proposalId: Id(e.proposalId),
        editSpans: e.editSpans.map((m) => m.toDomain()),
        mobilitySpans: e.mobilitySpans.map((m) => m.toDomain()),
      ),
    ),
    GRoutePreviewResultData__asEditRouteError e => Left(
      routeEditFailureFor(e.code, e.message),
    ),
    _ => Left(UnknownRouteEditFailure(code: G__typename)),
  };
}

@visibleForTesting
RouteEditFailure routeEditFailureFor(
  GRouteEditErrorCode code,
  String message,
) => switch (code) {
  GRouteEditErrorCode.STALE_ROUTE => StaleRouteFailure(serverMessage: message),
  GRouteEditErrorCode.INVALID_ANCHOR => InvalidRouteAnchorFailure(
    serverMessage: message,
  ),
  GRouteEditErrorCode.INVALID_EDIT => InvalidRouteEditFailure(
    serverMessage: message,
  ),
  GRouteEditErrorCode.TRIP_NOT_FOUND => RouteTripNotFoundFailure(
    serverMessage: message,
  ),
  _ => UnknownRouteEditFailure(code: code.name, serverMessage: message),
};
