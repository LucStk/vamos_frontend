import 'package:ferry/ferry.dart';
import "package:vamos_cartographie/core/config/app_environment.dart";
import "package:vamos_cartographie/core/backend/network/storage_datasource.dart";

abstract class BackendFactory {
  AppEnvironment get environment;

  Client createClient();

  StorageDatasource createStorage();
}
