import 'package:ferry/ferry.dart';
import 'package:gql_exec/gql_exec.dart';

/// Réponse succès : [data] est transmis tel quel, aucune erreur.
OperationResponse<TData, TVars> okResponse<TData, TVars>(
  OperationRequest<TData, TVars> req,
  TData data,
) => OperationResponse<TData, TVars>(
  operationRequest: req,
  data: data,
  graphqlErrors: null,
  linkException: null,
  dataSource: DataSource.None,
);

/// Réponse en erreur GraphQL (message configurable).
OperationResponse<TData, TVars> errResponse<TData, TVars>(
  OperationRequest<TData, TVars> req, [
  String message = 'Erreur serveur',
]) => OperationResponse<TData, TVars>(
  operationRequest: req,
  data: null,
  graphqlErrors: [GraphQLError(message: message)],
  linkException: null,
  dataSource: DataSource.None,
);

/// Réponse avec data=null et aucune erreur GQL (cas « données manquantes »).
OperationResponse<TData, TVars> nullDataResponse<TData, TVars>(
  OperationRequest<TData, TVars> req,
) => OperationResponse<TData, TVars>(
  operationRequest: req,
  data: null,
  graphqlErrors: null,
  linkException: null,
  dataSource: DataSource.None,
);
