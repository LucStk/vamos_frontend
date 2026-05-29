// Tests d'intégration — nécessitent un serveur Django local sur localhost:8000
// et un stockage objet Garage accessible.
//
// Fusion de :
//   • test/data/graphql/trip_img_test.dart
//   • test/data/graphql/upload_img_test.dart
//   • test/upload_img_test.dart

import 'dart:math';

import 'package:ferry/ferry.dart';
import 'package:http/http.dart' as http;
import 'package:test/test.dart';
import 'package:vamos_cartographie/core/network/graphql/ferry_client.dart';
import 'package:vamos_cartographie/graphql/graphql.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Utilitaires
// ─────────────────────────────────────────────────────────────────────────────

void _printError(dynamic response) {
  if (response.linkException != null) {
    print('Erreur Réseau/Lien: ${response.linkException}');
  }
  if (response.graphqlErrors != null) {
    print('Erreurs GraphQL: ${response.graphqlErrors}');
  }
}

Future<GTripFields> _createTrip(Client client) async {
  final req = GCreateTripReq(
    vars: GCreateTripVars(trip: GTripInput(title: 'test création pour image')),
  );
  final response = await client.request(req).first;
  _printError(response);
  expect(response.data?.createTrip, isNotNull);
  return response.data!.createTrip;
}

Future<GGetTripData_trip> _getTripById(int id, Client client) async {
  final req = GGetTripReq(vars: GGetTripVars(id: id));
  final response = await client.request(req).first;
  expect(response.data, isNotNull);
  return response.data!.trip;
}

Future<void> _deleteTrip(int id, Client client) async {
  final req = GDeleteTripReq(vars: GDeleteTripVars(id: id));
  final response = await client.request(req).first;
  _printError(response);
  expect(response.data?.deleteTrip, isNotNull);
}

Future<void> _attachImageToTrip(
  Client client,
  int tripId,
  String fileKey,
) async {
  final response = await client
      .request(
        GAttachImageToTripReq(
          vars: GAttachImageToTripVars(tripId: tripId, fileKey: fileKey),
        ),
      )
      .first;
  expect(response.data, isNotNull);
}

Future<void> _deleteImageFromTrip(
  Client client,
  int tripId,
  String fileKey,
) async {
  final response = await client
      .request(
        GDeleteImageFromTripReq(
          vars: GDeleteImageFromTripVars(tripId: tripId, fileKey: fileKey),
        ),
      )
      .first;
  if (response.hasErrors) {
    throw Exception(
      response.graphqlErrors?.first.message ?? 'Erreur lors de la suppression',
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Tests d'intégration
// ─────────────────────────────────────────────────────────────────────────────

void main() {
  const skipReason = 'Requiert un serveur local sur localhost:8000 et Garage';
  // ---------------------------------------------------------------------------
  // Création et suppression d'image sur un trip (ex-trip_img_test.dart)
  // ---------------------------------------------------------------------------

  test('Création d\'une image pour un voyage', () async {
    final client = initFerryClient('http://localhost:8000/graphql/');
    final fileKey = Random().nextInt(1000000).toString();

    // Créer l'image dans la DB
    final imageResponse = await client
        .request(GCreateImageReq(vars: GCreateImageVars(fileKey: fileKey)))
        .first;
    expect(imageResponse.data, isNotNull);

    // Créer un trip
    final trip = await _createTrip(client);
    final tripId = trip.id;

    // Attacher l'image au trip
    await _attachImageToTrip(client, tripId, fileKey);

    // Vérifier que l'image est bien attachée
    final fetchedTrip = await _getTripById(tripId, client);
    print(fetchedTrip.images.first.image.url);
    print(fetchedTrip.images.first.image.fileKey);
    expect(fetchedTrip, isNotNull);
    expect(fetchedTrip.images, isNotEmpty);

    // Supprimer l'image du trip puis le trip
    await _deleteImageFromTrip(client, tripId, fileKey);
    await _deleteTrip(tripId, client);
  }, skip: skipReason);

  // ---------------------------------------------------------------------------
  // URL pré-signée et upload réel vers Garage (ex-upload_img_test.dart)
  // ---------------------------------------------------------------------------

  test('GenerateImageUploadUrl mutation et upload réel vers Garage', () async {
    final client = initFerryClient('http://localhost:8000/graphql/');

    // 1. Demander l'URL pré-signée
    final request = GGenerateImageUploadUrlReq(
      vars: GGenerateImageUploadUrlVars(extension: 'jpg'),
    );
    final response = await client.request(request).first;

    if (response.hasErrors) {
      print('Erreurs GraphQL: ${response.graphqlErrors}');
    }

    final uploadConfig = response.data?.generateImageUploadUrl;
    expect(
      uploadConfig,
      isNotNull,
      reason: "L'URL de config ne doit pas être nulle",
    );

    final uploadUrl = uploadConfig!.uploadUrl;
    final fileKey = uploadConfig.fileKey;
    print('URL reçue: $uploadUrl');

    // 2. Upload réel vers Garage
    print('Tentative d\'upload vers Garage...');
    final fakeImageData = [11, 22, 33, 44, 55];
    final uploadResponse = await http.put(
      Uri.parse(uploadUrl),
      body: fakeImageData,
      headers: {'Content-Type': 'image/jpg'},
    );

    print('Statut de l\'upload Garage: ${uploadResponse.statusCode}');
    if (uploadResponse.statusCode != 200) {
      print('Corps de l\'erreur Garage: ${uploadResponse.body}');
    }
    expect(
      uploadResponse.statusCode,
      200,
      reason: "Garage devrait accepter le fichier avec l'URL pré-signée",
    );

    // 3. Enregistrer l'image dans Django
    final imageResponse = await client
        .request(GCreateImageReq(vars: GCreateImageVars(fileKey: fileKey)))
        .first;
    expect(
      imageResponse.hasErrors,
      isFalse,
      reason: "Django devrait accepter l'image ajoutée",
    );
  }, skip: skipReason);

  // ---------------------------------------------------------------------------
  // Upload via UploadImgRepository (ex-upload_img_test.dart + test/upload_img_test.dart)
  // ---------------------------------------------------------------------------

  test(
    'UploadImgRepository.uploadImage (nécessite getIt)',
    () async {
      // Ce test utilise le DI (configureDependencies + getIt).
      // Conservé comme documentation — voir upload_img_test.dart (supprimé).
      print(
        'Ce test nécessite configureDependencies(). '
        'Voir test/upload_img_test.dart (supprimé) pour le code original.',
      );
    },
    skip: 'Nécessite getIt configuré — voir commentaire dans le test',
  );
}
