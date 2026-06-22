import "package:vamos_cartographie/backend/core/fake/fake_backend_factory.dart";
import "package:vamos_cartographie/backend/core/real/real_backend_factory.dart";
import "package:vamos_cartographie/backend/core/staging/staging_backend_factory.dart";

import "backend_factory.dart";
import "package:vamos_cartographie/core/config/app_environment.dart";

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
