import 'package:api_client/src/ferry_client.dart';
// Importe le fichier .req.gql.dart (il contient la classe de requête)

import 'package:api_client/src/graphql/mutations/__generated__/image_upload.var.gql.dart';
import 'package:api_client/src/graphql/mutations/__generated__/image_upload.req.gql.dart';
import 'package:api_client/src/graphql/__generated__/schema.schema.gql.dart';
import 'package:test/test.dart';

void printError(response) {
  if (response.linkException != null) {
    print("Erreur Réseau/Lien: ${response.linkException}");
  }

  // Affiche les erreurs retournées par Django (ex: colonnes manquantes, fautes de frappe)
  if (response.graphqlErrors != null) {
    print("Erreurs GraphQL: ${response.graphqlErrors}");
  }
}

void main() {
  test('GenerateImageUploadUrl mutation', () async {
    final client = initFerryClient('http://localhost:8000/graphql/');

    // 1. On utilise la classe générée : GMyQuery
    // 2. On utilise client.request()
    // 3. On utilise .first pour attendre la première réponse (car request renvoie un Stream)
    final request = GGenerateImageUploadUrlReq(
      vars: GGenerateImageUploadUrlVars(extension: 'jpg'),
    );
    final response = await client.request(request).first;
    print("génerateImageUploadUrl ${response.data?.generateImageUploadUrl}");
    expect(response.data?.generateImageUploadUrl, isNotNull);
  });
}
