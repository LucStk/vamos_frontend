import "package:vamos_cartographie/core/network/graphql/backend/backend_factory.dart";

import "package:vamos_cartographie/core/network/graphql/backend/app_environment.dart";
import "package:ferry/ferry.dart";
import "package:vamos_cartographie/dev_backend/core/fake_graphql_store_factory.dart";
import "package:vamos_cartographie/dev_backend/transport/fake_link.dart";

class FakeBackendFactory implements BackendFactory {
  @override
  AppEnvironment get environment => AppEnvironment.fake;

  @override
  Client createClient() {
    final store = FakeGraphQLStoreFactory.withDefaultSeed();

    final link = FakeLink(store);

    return Client(link: link);
  }
}
