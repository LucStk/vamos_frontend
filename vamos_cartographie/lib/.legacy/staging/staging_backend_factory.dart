import 'package:dio/dio.dart';
import 'package:vamos_cartographie/backend/core/backend_factory.dart';
import 'package:vamos_cartographie/backend/core/network/network.dart';
import "package:vamos_cartographie/core/config/app_environment.dart";
import "package:ferry/ferry.dart";
import 'package:gql_http_link/gql_http_link.dart';

class StagingBackendFactory implements BackendFactory {
  @override
  AppEnvironment get environment => AppEnvironment.real;

  @override
  Client createClient() {
    final link = HttpLink('http://localhost:8000/graphql/');

    final client = Client(
      link: link,
      // Le cache normalisé est l'un des gros points forts de Ferry
      cache: Cache(),
    );

    return client;
  }

  @override
  StorageDatasource createStorage() {
    return DioStorageDatasource(Dio());
  }
}
