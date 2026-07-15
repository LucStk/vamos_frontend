import 'package:ferry/ferry.dart';
import "package:riverpod_annotation/riverpod_annotation.dart";
import '/core/network/ferry_client.dart';
part "client_provider.g.dart";

@riverpod
Client clientNotifier(Ref ref) {
  return createClient();
}
