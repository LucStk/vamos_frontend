import '../geosearch_failures.dart';
import '../geosearch_remote_datasource.dart';

extension GeosearchRequestExceptionX on GeosearchRequestException {
  GeosearchFailure toFailure() => switch (code) {
    'BAD_USER_INPUT' => InvalidSearchFailure(message ?? 'Recherche invalide.'),
    'SEARCH_UNAVAILABLE' => const SearchUnavailableFailure(),
    _ => const SearchNetworkFailure(),
  };
}
