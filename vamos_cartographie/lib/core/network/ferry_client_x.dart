// core/network/ferry_client_x.dart
import 'package:ferry/ferry.dart';
import 'package:flutter/cupertino.dart';
import 'graphql_request_exception.dart';

extension FerryClientX on Client {
  Future<TData> execute<TData, TVars>(
    OperationRequest<TData, TVars> request,
  ) async {
    final response = await this
        .request(request)
        .firstWhere((r) => !r.loading || r.hasErrors || r.linkException != null)
        .timeout(const Duration(seconds: 15));

    if (response.linkException != null || response.hasErrors) {
      debugPrint('linkException: ${response.linkException}');
      debugPrint('graphqlErrors: ${response.graphqlErrors}');
      throw GraphQLRequestException(
        linkException: response.linkException,
        graphqlErrors: response.graphqlErrors ?? [],
      );
    }
    return response.data as TData;
  }
}
