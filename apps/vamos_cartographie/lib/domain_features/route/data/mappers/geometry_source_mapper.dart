// 2. De GraphQL (GMobilityType) VERS ton modèle local (MobilityType)
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/core/errors/mapping_failure.dart';
import 'package:vamos_cartographie/core/graphql/__generated__/schema.schema.gql.dart';

extension GGeometrySourceMapper on GGeometrySource {
  GeometrySource toDomain() => switch (this) {
    GGeometrySource.COMPUTED => GeometrySource.computed,
    GGeometrySource.DRAWN => GeometrySource.drawn,
    GGeometrySource.gUnknownEnumValue => throw MappingFailure.unknownEnumValue(
      "GeometrySource",
    ),
  };
}
