import 'package:ferry/ferry.dart';
import 'package:gql_http_link/gql_http_link.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Client createClient() {
  final httpLink = HttpLink('http://localhost:8000/graphql/');

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

  final link = Link.from([authLink, httpLink]);

  return Client(link: link, cache: Cache());
}
