import 'package:api_client/api_client.dart';
import 'package:dartz/dartz.dart';
import 'package:ferry/ferry.dart';
import 'package:vamos_cartographie/core/failure.dart';
import 'package:vamos_cartographie/models.dart';

class AppConfigRepository {
  final Client _client;

  AppConfigRepository(this._client);

  // Le type de retour devient votre classe propre, plus celle de Ferry
  Future<Either<Failure, AppConfig>> getAppConfig() async {
    try {
      final response = await _client
          .request(GGetAppConfigReq(fetchPolicy: FetchPolicy.NetworkOnly))
          .first;

      if (response.hasErrors) {
        return Left(
          ServerFailure(
            response.graphqlErrors?.first.message ?? "Erreur inconnue",
          ),
        );
      }

      final appConfigData = response.data?.appConfig;
      if (appConfigData == null) return Left(NotFoundFailure());

      // On convertit le type Ferry vers notre classe propre
      return Right(AppConfig(imageBaseUrl: appConfigData.imageBaseUrl));
    } catch (e) {
      return Left(ConnectionFailure());
    }
  }
}
