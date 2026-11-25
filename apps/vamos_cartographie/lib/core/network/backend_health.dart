// core/network/backend_health.dart
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:vamos_cartographie/core/network/client_config.dart';

/// Liaison avec le backend, vue depuis l'application.
enum BackendHealth {
  /// Le backend a répondu à la dernière requête. État initial : rien ne prouve
  /// encore le contraire, et un bandeau affiché au démarrage serait un mensonge
  /// une fois sur deux.
  online,

  /// La dernière requête n'a pas atteint le backend.
  offline,

  /// Vérification en cours, demandée par [BackendHealthMonitor.recheck].
  checking,
}

/// `true` si le backend est joignable. Injectable pour les tests.
typedef BackendProbe = Future<bool> Function();

/// Suit la joignabilité du backend et permet de la retester à la demande.
///
/// Alimenté par le lien Ferry (voir `ferry_client.dart`) : toute réponse reçue
/// vaut [BackendHealth.online], tout échec de transport vaut
/// [BackendHealth.offline]. Une erreur GraphQL n'y change rien — le serveur a
/// répondu, donc il est joignable.
///
/// Singleton, comme `ErrorHandler.instance` : le lien Ferry est construit en
/// dehors de tout `ProviderContainer`. Pour le lire via Riverpod malgré tout :
///
/// ```dart
/// final backendHealthProvider = Provider<BackendHealthMonitor>(
///   (ref) => BackendHealthMonitor.instance,
/// );
/// ```
class BackendHealthMonitor extends ValueNotifier<BackendHealth> {
  BackendHealthMonitor({BackendProbe? probe})
    : _probe = probe ?? pingBackend,
      super(BackendHealth.online);

  /// Instance utilisée par le client Ferry et par le bandeau de connexion.
  static final BackendHealthMonitor instance = BackendHealthMonitor();

  final BackendProbe _probe;

  final ValueNotifier<int> _reconnections = ValueNotifier(0);

  /// Incrémenté à chaque retour en ligne, jamais décrémenté.
  ///
  /// Point d'accroche pour recharger des données après une coupure, sans que
  /// ce fichier connaisse les features :
  ///
  /// ```dart
  /// // Dans un provider : se recalcule à chaque reconnexion.
  /// ref.watch(reconnectionsProvider);
  /// ```
  ValueListenable<int> get reconnections => _reconnections;

  bool get isOffline => value != BackendHealth.online;

  /// Le backend a parlé.
  void reportReachable() {
    // Pendant un test manuel, c'est [recheck] qui tranche.
    if (value == BackendHealth.checking) return;
    _goOnline();
  }

  /// Le backend n'a pas répondu (socket, DNS, TLS, 5xx, silence prolongé).
  void reportUnreachable() {
    if (value == BackendHealth.checking) return;
    value = BackendHealth.offline;
  }

  /// Retente une connexion. Renvoie `true` si le backend a répondu.
  ///
  /// Appelé par le bandeau de connexion, mais utilisable ailleurs (au retour
  /// de l'app au premier plan, par exemple).
  Future<bool> recheck() async {
    if (value == BackendHealth.checking) return false;
    value = BackendHealth.checking;

    final reachable = await _probe();
    if (reachable) {
      _goOnline();
    } else {
      value = BackendHealth.offline;
    }
    return reachable;
  }

  void _goOnline() {
    final wasDown = value != BackendHealth.online;
    value = BackendHealth.online;
    if (wasDown) _reconnections.value++;
  }

  @override
  void dispose() {
    _reconnections.dispose();
    super.dispose();
  }
}

/// Un POST GraphQL minimal sur l'URL du backend.
///
/// On ne juge que la joignabilité : un code < 500 signifie que le backend a
/// répondu, même pour refuser (403 sans session, par exemple). Le contenu de
/// la réponse ne nous intéresse pas.
Future<bool> pingBackend({
  Duration timeout = const Duration(seconds: 4),
}) async {
  final url = ClientConfig.url;
  if (url.isEmpty) return false;

  final dio = Dio(
    BaseOptions(
      connectTimeout: timeout,
      sendTimeout: timeout,
      receiveTimeout: timeout,
      // Le code HTTP est une donnée, pas une erreur.
      validateStatus: (_) => true,
    ),
  );

  try {
    final response = await dio.post<Object?>(
      url,
      data: const {'query': 'query VamosPing { __typename }'},
      options: Options(contentType: Headers.jsonContentType),
    );
    final code = response.statusCode ?? 0;
    return code > 0 && code < 500;
  } catch (error) {
    debugPrint('ping backend injoignable : $error');
    return false;
  } finally {
    dio.close(force: true);
  }
}
