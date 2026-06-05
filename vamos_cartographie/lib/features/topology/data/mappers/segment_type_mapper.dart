import 'package:vamos_cartographie/graphql/__generated__/schema.schema.gql.dart';
import 'package:vamos_cartographie/features/topology/domain/domain.dart'; // Ajuste le chemin selon ton projet

// 1. De ton modèle local (SegmentType) VERS GraphQL (GSegmentTypeEnum)
extension SegmentTypeMapper on SegmentType {
  GSegmentTypeEnum toGQL() => switch (this) {
    SegmentType.bike => GSegmentTypeEnum.bike,
    SegmentType.car => GSegmentTypeEnum.car,
    SegmentType.boat => GSegmentTypeEnum.boat,
    SegmentType.walk => GSegmentTypeEnum.walk,
    SegmentType.train => GSegmentTypeEnum.train,
  };
}

// 2. De GraphQL (GSegmentTypeEnum) VERS ton modèle local (SegmentType)
extension GSegmentTypeEnumMapper on GSegmentTypeEnum {
  SegmentType toDomain() => switch (this) {
    GSegmentTypeEnum.bike => SegmentType.bike,
    GSegmentTypeEnum.car => SegmentType.car,
    GSegmentTypeEnum.boat => SegmentType.boat,
    GSegmentTypeEnum.walk => SegmentType.walk,
    GSegmentTypeEnum.train => SegmentType.train,
    _ =>
      SegmentType.bike, // Valeur de fallback par défaut en cas de type inconnu
  };
}
