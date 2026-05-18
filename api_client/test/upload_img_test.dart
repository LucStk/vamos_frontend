import 'package:api_client/src/ferry_client.dart';
import 'package:api_client/api_client.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http; // Ajout de l'import http

void main() {
  test('GenerateImageUploadUrl mutation and actual S3 upload', () async {
    final client = initFerryClient('http://localhost:8000/graphql/');

    // 1. Demande de l'URL pré-signée via Ferry
    final request = GGenerateImageUploadUrlReq(
      vars: GGenerateImageUploadUrlVars(extension: 'jpg'),
    );

    final response = await client.request(request).first;

    // Debugging en cas d'erreur
    if (response.hasErrors) {
      print("Erreurs GraphQL: ${response.graphqlErrors}");
    }

    final uploadConfig = response.data?.generateImageUploadUrl;
    expect(
      uploadConfig,
      isNotNull,
      reason: "L'URL de config ne doit pas être nulle",
    );

    final uploadUrl = uploadConfig!.uploadUrl;
    final fileKey = uploadConfig.fileKey;

    print("URL reçue: $uploadUrl");

    // 2. Tentative d'upload réel vers Garage
    print("Tentative d'upload vers Garage...");

    final fakeImageData = [
      11,
      22,
      33,
      44,
      55,
    ]; // Simulation d'un fichier binaire

    final uploadResponse = await http.put(
      Uri.parse(uploadUrl),
      body: fakeImageData,
      headers: {
        'Content-Type':
            'image/jpg', // Doit matcher EXACTEMENT ce que Django a signé
      },
    );

    // 3. Vérifications
    print("Statut de l'upload Garage: ${uploadResponse.statusCode}");
    if (uploadResponse.statusCode != 200) {
      print("Corps de l'erreur Garage: ${uploadResponse.body}");
    }
    expect(
      uploadResponse.statusCode,
      200,
      reason: "Garage devrait accepter le fichier avec l'URL pré-signée",
    );
    // Ajout de l'image dans la base de données Django
    final imageResponse = await client
        .request(GCreateImageReq(vars: GCreateImageVars(fileKey: fileKey)))
        .first;
    expect(
      imageResponse.hasErrors,
      isFalse,
      reason: "Django devrait accepter l'image ajoutée",
    );
  });
}
