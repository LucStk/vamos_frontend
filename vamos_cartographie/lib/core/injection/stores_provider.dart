// features/vertexs/presentation/providers/vertexs_notifier.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trip_domain/trip_domain.dart';
part 'stores_provider.g.dart';

@riverpod
TripStore tripStore(Ref ref) {
  return TripStore();
}
