import "package:vamos_cartographie/backend/core/backend_factory.dart";
import "package:vamos_cartographie/backend/core/fake_graphql_store.dart";
import "package:vamos_cartographie/backend/core/fake_storage_datasource.dart";
import "package:vamos_cartographie/backend/core/network/network.dart";
import "package:vamos_cartographie/backend/seeds/explore_seed.dart";
import "package:vamos_cartographie/backend/transport/fake_link.dart";
import "package:vamos_cartographie/core/config/app_environment.dart";
import "package:ferry/ferry.dart";

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
