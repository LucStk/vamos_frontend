import 'package:vamos_cartographie/backend/graphql/__generated__/schema.schema.gql.dart';
import 'package:topology_engine/domain/domain.dart';

// 1. De ton modèle local (MobilityType) VERS GraphQL (GMobilityType)
extension MobilityTypeMapper on MobilityType {
  GMobilityType toGQL() => switch (this) {
    MobilityType.bike => GMobilityType.BIKE,
    MobilityType.car => GMobilityType.CAR,
    MobilityType.boat => GMobilityType.BOAT,
    MobilityType.walk => GMobilityType.WALK,
    MobilityType.train => GMobilityType.TRAIN,
  };
}

// 2. De GraphQL (GMobilityType) VERS ton modèle local (MobilityType)
extension GMobilityTypeMapper on GMobilityType {
  MobilityType toDomain() => switch (this) {
    GMobilityType.BIKE => MobilityType.bike,
    GMobilityType.CAR => MobilityType.car,
    GMobilityType.BOAT => MobilityType.boat,
    GMobilityType.WALK => MobilityType.walk,
    GMobilityType.TRAIN => MobilityType.train,
    _ =>
      MobilityType.bike, // Valeur de fallback par défaut en cas de type inconnu
  };
}
