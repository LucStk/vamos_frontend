import 'package:ferry/ferry.dart';
import 'package:gql_http_link/gql_http_link.dart';

Client initFerryClient(String endpoint) {
  final link = HttpLink(endpoint);

  final client = Client(
    link: link,
    // Le cache normalisé est l'un des gros points forts de Ferry
    cache: Cache(),
  );

  return client;
}
