import 'package:vamos_cartographie/core/injection.dart';
import 'package:test/test.dart';
import 'package:vamos_cartographie/models.dart';

void main() async {
  // Obligatoire si tu fais du async avant runApp
  // WidgetsFlutterBinding.ensureInitialized();
  // On initialise GetIt
  await configureDependencies();
  test('test getAllTrips', () async {
    final result = getIt<AppConfig>();
    print(result);
    expect(result, isNotNull);
  });
}
