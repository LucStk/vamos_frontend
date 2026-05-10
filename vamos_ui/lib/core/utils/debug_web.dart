import 'dart:js' as js;
import 'package:vamos_flutter/core/services/token_service.dart';
import 'package:vamos_flutter/features/authentication/services/authentication_service.dart';

void setupWebDebug() {
  js.context['printAuthTokens'] = () async {
    final tokenService = TokenService();
    final accessToken = await tokenService.getAccessToken();
    final refreshToken = await tokenService.getRefreshToken();

    print('Access Token: $accessToken');
    print('Refresh Token: $refreshToken');

    // Retourner un objet JS pour inspection directe si besoin
    return js.JsObject.jsify({
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    });
  };

  js.context['forceRefreshToken'] = () async {
    print('Tentative de rafraîchissement du token...');
    final success = await AuthService.forceRefreshToken();
    if (success) {
      print('Token rafraîchi avec succès !');
    } else {
      print('Échec du rafraîchissement du token.');
    }
    return success;
  };

  print(
      'Debug: printAuthTokens() et forceRefreshToken() sont disponibles dans la console.');
}
