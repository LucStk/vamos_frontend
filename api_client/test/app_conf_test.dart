import 'package:api_client/src/ferry_client.dart';
import 'package:api_client/src/graphql/queries/__generated__/app_config.req.gql.dart';

import 'package:test/test.dart';

void main() {
  test('Get app configuration', () async {
    final client = initFerryClient('http://localhost:8000/graphql/');

    // 1. Demande de l'URL pré-signée via Ferry
    final request = GGetAppConfigReq();

    final response = await client.request(request).first;
    print(response.data?.appConfig.imageBaseUrl);
    expect(
      response.data?.appConfig.imageBaseUrl,
      isNotNull,
      reason: "la config devrait contenir l'URL de base pour les images",
    );
  });
}
