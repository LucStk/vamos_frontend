import 'package:vamos_cartographie/core/injection.dart';
import 'package:test/test.dart';
import 'package:vamos_cartographie/features/trips/data/repositories/upload_img_repository.dart';
import 'dart:io';
import 'package:path/path.dart' as p;

// Dans ton test :

void main() async {
  // Obligatoire si tu fais du async avant runApp
  // WidgetsFlutterBinding.ensureInitialized();
  // On initialise GetIt
  await configureDependencies();
  test('test uploadImage', () async {
    final tempDir = Directory.systemTemp; // Dossier temporaire de l'OS
    final mockFile = File(p.join(tempDir.path, 'test_image.jpg'));

    // Off écrit quelques octets bidon pour simuler une image
    await mockFile.writeAsBytes([-1, 1, 2, 3]);
    final result = await getIt<UploadImgRepository>().uploadImage(
      mockFile,
      "jpeg",
    );
    result.fold(
      (failure) {
        print(failure);
        throw failure;
      },
      (urls) {
        print("voici l'url pour accéder à l'image : {$urls}");
      },
    );
  });
}
