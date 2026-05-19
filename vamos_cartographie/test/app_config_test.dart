import 'package:vamos_cartographie/core/config.dart';
import 'package:vamos_cartographie/core/injection.dart';
import 'package:test/test.dart';

void main() async {
  await configureDependencies();

  test('AppConfig est bien enregistré dans GetIt', () async {
    final config = getIt<AppConfig>();
    print(config);
    expect(config, isNotNull);
  });
}
