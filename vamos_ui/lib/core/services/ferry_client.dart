import 'package:ferry/ferry.dart';
import 'package:ferry_hive_store/ferry_hive_store.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:gql_http_link/gql_http_link.dart';
// import 'package:gql_error_link/gql_error_link.dart';

// import 'package:vamos_flutter/core/services/token_service.dart';
// import 'package:vamos_flutter/core/services/skip_auth_context.dart';

// import "package:vamos_flutter/schemas/__generated__/schema.schema.gql.dart"
//     show possibleTypesMap;

// import "package:vamos_flutter/core/requests/__generated__/jwt.req.gql.dart";
// import 'package:gql_exec/gql_exec.dart';

const apiURL = 'http://[::1]:8000/graphql/';

Future<Client> initClient() async {
  // await Hive.initFlutter();

  // final box = await Hive.openBox("graphql");
  // final store = HiveStore(box);

  // final cache = Cache(store: store, possibleTypes: possibleTypesMap);

  final httplink = HttpLink(apiURL);
  // final errorLink = createErrorLink();
  // final authLink = createAuthLink();
  // final loggingLink = createLoggingLink();

  // final link = loggingLink.concat(errorLink).concat(authLink).concat(httplink);

  return Client(link: httplink);
}
//         'Authorization': 'JWT $token',
//       },
//     ),
//   );
// }

// tryRefreshingToken({Client? client}) async {
//   final oldRefreshToken = await TokenService().getRefreshToken();
//   if (oldRefreshToken == null) return false;

//   final temporaryClient = client ??
//       Client(
//         link: HttpLink(
//           apiURL,
//         ),
//         cache: Cache(),
//       );

//   try {
//     final request = GRefreshTokenReq((b) => b
//       ..vars.refreshtoken = oldRefreshToken
//       ..fetchPolicy = FetchPolicy.NetworkOnly);

//     final result = await temporaryClient.request(request).first;

//     if (result.hasErrors) {
//       print('Échec du rafraîchissement: ${result.graphqlErrors}');
//       return false;
//     }

//     final newTokensData = result.data?.refreshToken;

//     if (newTokensData == null) {
//       print('Réponse de rafraîchissement invalide ou vide.');
//       return false;
//     }

//     await TokenService().saveTokens(
//       newTokensData.token,
//       newTokensData.refreshToken,
//     );

//     return true;
//   } catch (e) {
//     print('Erreur inattendue lors du rafraîchissement: $e');
//   }

//   return false;
// }

// /// Gère les erreurs GraphQL, notamment TOKEN_EXPIRED
// Link createErrorLink({Future<bool> Function()? tokenRefresher}) {
//   final refresher = tokenRefresher ?? tryRefreshingToken;
//   return ErrorLink(onGraphQLError: (request, forward, response) async* {
//     if (response.errors?.any((e) => e.extensions?['code'] == "TOKEN_EXPIRED") ??
//         false) {
//       // Tentative de rafraîchissement du token
//       final refreshed = await refresher();

//       if (refreshed) {
//         print('Token rafraîchi avec succès, nouvelle tentative de requête...');
//         // Récupère le nouveau token et relance la requête
//         final newToken = await TokenService().getAccessToken();
//         if (newToken != null) {
//           final retryRequest = addAuthHeader(request, newToken);
//           // Relance la requête avec le nouveau token
//           yield* forward(retryRequest);
//           return;
//         }
//       } else {
//         print('Échec du rafraîchissement du token, déconnexion nécessaire');
//         // Optionnel : déclencher une déconnexion ou redirection vers login
//         // await TokenService().clearTokens();
//         // NavigationService.navigateToLogin();
//       }
//     }

//     // Si pas d'erreur TOKEN_EXPIRED ou échec de rafraîchissement, retourne la réponse originale
//     yield response;
//   });
// }

// /// Gère l'authentification en injectant le token JWT
// Link createAuthLink() {
//   return Link.function((request, [next]) async* {
//     // Vérifie si la requête contient le marqueur SkipAuthContext
//     if (request.context.entry<SkipAuthContext>() != null) {
//       yield* next!(request);
//       return;
//     }

//     final token = await TokenService().getAccessToken();

//     if (token != null) {
//       final updatedRequest = addAuthHeader(request, token);
//       yield* next!(updatedRequest);
//     } else {
//       yield* next!(request);
//     }
//   });
// }

// // Créer un link de logging
// Link createLoggingLink() {
//   return Link.function((request, [forward]) async* {
//     print('🚀 Requête GraphQL: ${request.operation.operationName}');
//     print('   Variables: ${request.variables}');

//     yield* forward!(request).asyncMap((response) async {
//       print('📥 Réponse GraphQL: ${request.operation.operationName}');
//       print('   Has errors: ${response.errors?.isNotEmpty ?? false}');
//       print('   Data: ${response.data?.keys.join(", ")}');

//       return response;
//     });
//   });
// }
