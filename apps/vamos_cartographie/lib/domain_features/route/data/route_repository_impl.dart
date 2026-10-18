import 'package:dartz/dartz.dart';
import 'package:latlong2/latlong.dart';
import 'package:trip_application/trip_application.dart';
import 'package:domain_core/domain_core.dart';
import 'package:vamos_cartographie/core/erreur_handler.dart';
import 'package:vamos_cartographie/core/geometry_mappers/position_mapper.dart';
import 'package:vamos_cartographie/core/graphql/__generated__/schema.schema.gql.dart';
import 'package:vamos_cartographie/domain_features/route/data/route_remote_datasource.dart';

class RouteRepositoryImpl extends RouteRepository {
  final RouteRemoteDatasource remote;

  RouteRepositoryImpl(this.remote);
}
