import 'package:flutter/foundation.dart';
import 'package:vamos_cartographie/backend/core/network/network.dart';
import 'backend_factory.dart';
import "package:ferry/ferry.dart";

class BackendController extends ChangeNotifier {
  BackendFactory _factory;
  Client? _client;
  StorageDatasource? _storage;

  BackendController(this._factory);
  Client get client => _client ??= _factory.createClient();

  StorageDatasource get storageDatasource =>
      _storage ??= _factory.createStorage();

  void switchBackend(BackendFactory factory) {
    _factory = factory;
    _client = null;
    _storage = null;
    notifyListeners();
  }
}
