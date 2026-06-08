import 'package:flutter/foundation.dart';
import 'backend_factory.dart';
import 'backend_registry.dart';
import "package:ferry/ferry.dart";
import "package:vamos_cartographie/core/network/graphql/backend/app_environment.dart";

class BackendController extends ChangeNotifier {
  BackendFactory _factory;
  late Client _client;

  BackendController(this._factory) {
    _client = _factory.createClient();
  }

  Client get client => _client;

  AppEnvironment get environment => _factory.environment;

  void switchBackend(BackendFactory factory) {
    _factory = factory;
    _client = factory.createClient();
    notifyListeners();
  }

  void switchEnvironment(AppEnvironment env) {
    switchBackend(BackendRegistry.resolve(env));
  }
}
