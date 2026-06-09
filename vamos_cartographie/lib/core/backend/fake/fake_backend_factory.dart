import "package:vamos_cartographie/core/backend/backend_factory.dart";

import "package:vamos_cartographie/core/config/app_environment.dart";
import "package:ferry/ferry.dart";
import "package:vamos_cartographie/dev_backend/transport/fake_link.dart";
import "package:vamos_cartographie/dev_backend/core/fake_graphql_store.dart";
import "package:vamos_cartographie/dev_backend/seeds/explore_seed.dart";
import "package:vamos_cartographie/core/network/network.dart";
import "package:vamos_cartographie/dev_backend/core/fake_storage_datasource.dart";

class FakeBackendFactory implements BackendFactory {
  @override
  AppEnvironment get environment => AppEnvironment.fake;

  @override
  Client createClient() {
    final store = FakeGraphQLStore(exploreSeed);
    final link = FakeGraphQLLink(store);
    return Client(link: link);
  }

  @override
  StorageDatasource createStorage() {
    return FakeStorageDatasource();
  }
}
