import 'package:ferry/ferry.dart';
import "package:riverpod_annotation/riverpod_annotation.dart";
import '/core/network/ferry_client.dart';
part "client_provider.g.dart";

@Riverpod(keepAlive: true)
Client client(Ref ref) {
  return createClient();
}
