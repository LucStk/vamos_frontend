import 'package:ferry/ferry.dart';
import "package:vamos_cartographie/core/network/graphql/backend/app_environment.dart";

abstract class BackendFactory {
  AppEnvironment get environment;

  Client createClient();
}
