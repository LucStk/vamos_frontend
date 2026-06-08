import "package:vamos_cartographie/core/network/graphql/backend/backend_factory.dart";

import "package:vamos_cartographie/core/network/graphql/backend/app_environment.dart";
import "package:ferry/ferry.dart";
import "package:vamos_cartographie/dev_backend/transport/fake_link.dart";
import "package:vamos_cartographie/dev_backend/core/fake_graphql_store.dart";
import "package:vamos_cartographie/dev_backend/seeds/explore_seed.dart";

class FakeBackendFactory implements BackendFactory {
  @override
  AppEnvironment get environment => AppEnvironment.fake;

  @override
  Client createClient() {
    final store = FakeGraphQLStore(exploreSeed);

    final link = FakeLink(store);

    return Client(link: link);
  }
}
