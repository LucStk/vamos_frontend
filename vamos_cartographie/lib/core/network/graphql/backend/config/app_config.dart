import "package:vamos_cartographie/core/network/graphql/backend/app_environment.dart";

class AppConfig {
  static AppEnvironment get environment {
    const env = String.fromEnvironment('ENV', defaultValue: 'fake');

    switch (env) {
      case 'real':
        return AppEnvironment.real;
      case 'staging':
        return AppEnvironment.staging;
      default:
        return AppEnvironment.fake;
    }
  }
}
