import "package:ferry/ferry.dart";
import 'package:gql_http_link/gql_http_link.dart';

Client createClient() {
  final link = HttpLink('http://localhost:8000/graphql/');

  final client = Client(
    link: link,
    // Le cache normalisé est l'un des gros points forts de Ferry
    cache: Cache(),
  );

  return client;
}
