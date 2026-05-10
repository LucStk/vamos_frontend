import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenService {
  // Singleton (optionnel, mais pratique)
  static TokenService? _mockInstance;
  static set mockInstance(TokenService? instance) => _mockInstance = instance;
  static final TokenService _instance = TokenService._internal();
  factory TokenService() => _mockInstance ?? _instance;
  TokenService._internal();

  // Configuration du stockage
  static const _storage = FlutterSecureStorage(
    // Options pour Android : utilise EncryptedSharedPreferences (plus sûr)
    aOptions: AndroidOptions(),
    // Options pour iOS : utilise le Keychain (plus sûr)
    iOptions: IOSOptions(),
    // Options pour Web : nécessaire pour que ça fonctionne sur le navigateur
    webOptions: WebOptions(
      dbName: 'vamos_flutter_auth',
      publicKey:
          'vamos_flutter_secret_key', // Optionnel, mais recommandé pour préfixer les clés
    ),
  );

  static const _accessTokenKey = 'access_token';
  static const _refreshTokenKey = 'refresh_token';

  // Sauvegarder les tokens
  Future<void> saveTokens(String accessToken, String refreshToken) async {
    await _storage.write(key: _accessTokenKey, value: accessToken);
    await _storage.write(key: _refreshTokenKey, value: refreshToken);
  }

  // Lire l'Access Token
  Future<String?> getAccessToken() async {
    return await _storage.read(key: _accessTokenKey);
  }

  // Lire le Refresh Token
  Future<String?> getRefreshToken() async {
    return await _storage.read(key: _refreshTokenKey);
  }

  // Supprimer les tokens (Déconnexion)
  Future<void> deleteTokens() async {
    await _storage.delete(key: _accessTokenKey);
    await _storage.delete(key: _refreshTokenKey);
  }

  // Vérifier si l'Access Token est valide (existe et non expiré)
  static Future<bool> hasValidAccessToken() async {
    // Pour simplifier, on vérifie juste s'il existe.
    // Pour une vraie application, il faudrait décoder le token JWT et vérifier la date d'expiration.
    final refreshToken = await _storage.read(key: _refreshTokenKey);

    return refreshToken != null;
  }
}
