import "backend_factory.dart";
import "package:vamos_cartographie/core/network/graphql/backend/app_environment.dart";
import "package:vamos_cartographie/core/network/graphql/real/real_backend_factory.dart";
import "package:vamos_cartographie/core/network/graphql/staging/staging_backend_factory.dart";
import "package:vamos_cartographie/core/network/graphql/fake/fake_backend_factory.dart";

class BackendRegistry {
  static BackendFactory resolve(AppEnvironment env) {
    switch (env) {
      case AppEnvironment.real:
        return RealBackendFactory();

      case AppEnvironment.fake:
        return FakeBackendFactory();

      case AppEnvironment.staging:
        return StagingBackendFactory();
    }
  }
}
