import 'dart:async';

import 'package:ferry/ferry.dart';
import 'package:gql_exec/gql_exec.dart' show Response;
import 'package:gql_link/gql_link.dart' show ResponseFormatException;
import 'package:gql_http_link/gql_http_link.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vamos_cartographie/core/network/backend_health.dart';
import 'package:vamos_cartographie/core/network/client_config.dart';

/// Passé ce délai sans la moindre réponse, le backend est tenu pour
/// injoignable. Sans ce garde-fou, un serveur qui accepte la connexion puis se
/// tait n'est jamais signalé : le `timeout` de `FerryClientX.execute` annule le
/// flux, et une annulation n'est pas une erreur.
const _silenceBeforeOffline = Duration(seconds: 8);

/// [health] n'existe que pour les tests : par défaut le client alimente le
/// moniteur global, celui que lit le bandeau de connexion.
Client createClient({BackendHealthMonitor? health}) {
  ClientConfig.validate();
  final httpLink = HttpLink(ClientConfig.url);

  // Remplace AuthLink par Link.function
  final authLink = Link.function((request, [forward]) {
    final token = Supabase.instance.client.auth.currentSession?.accessToken;
    final updatedRequest = request.updateContextEntry<HttpLinkHeaders>(
      (headers) => HttpLinkHeaders(
        headers: {
          ...?headers?.headers,
          if (token != null) 'Authorization': 'Bearer $token',
        },
      ),
    );

    return forward!(updatedRequest);
  });

  final link = Link.from([
    // En tête de chaîne : il voit tout ce qui part et tout ce qui revient.
    _healthLink(health ?? BackendHealthMonitor.instance),
    authLink,
    httpLink,
  ]);

  return Client(
    link: link,
    cache: Cache(),
    defaultFetchPolicies: {OperationType.query: FetchPolicy.NetworkOnly},
  );
}

Link _healthLink(BackendHealthMonitor health) =>
    Link.function((request, [forward]) => _watch(forward!(request), health));

/// Observe le flux sans le modifier : une réponse vaut « joignable », une
/// erreur de transport ou un silence trop long valent « injoignable ».
Stream<Response> _watch(Stream<Response> upstream, BackendHealthMonitor health) {
  late StreamSubscription<Response> subscription;
  late StreamController<Response> controller;
  Timer? watchdog;

  void stopWatchdog() {
    watchdog?.cancel();
    watchdog = null;
  }

  controller = StreamController<Response>(
    onListen: () {
      watchdog = Timer(_silenceBeforeOffline, health.reportUnreachable);
      subscription = upstream.listen(
        (response) {
          stopWatchdog();
          health.reportReachable();
          controller.add(response);
        },
        onError: (Object error, StackTrace stackTrace) {
          stopWatchdog();
          if (_reachedBackend(error)) {
            health.reportReachable();
          } else {
            health.reportUnreachable();
          }
          controller.addError(error, stackTrace);
        },
        onDone: () {
          stopWatchdog();
          controller.close();
        },
      );
    },
    onPause: () => subscription.pause(),
    onResume: () => subscription.resume(),
    // Requête abandonnée (timeout de `execute`, écran fermé) : on ne conclut
    // rien, mais on éteint le minuteur.
    onCancel: () {
      stopWatchdog();
      return subscription.cancel();
    },
  );

  return controller.stream;
}

/// Une réponse illisible vient quand même du backend : il est joignable, c'est
/// son contenu qui est en cause. Tout le reste (socket, DNS, TLS, 5xx) non.
bool _reachedBackend(Object error) => error is ResponseFormatException;
