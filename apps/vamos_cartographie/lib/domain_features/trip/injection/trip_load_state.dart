// domain_features/trip/injection/trip_load_state.dart
import 'package:domain_core/domain_core.dart';

sealed class TripLoadState {
  const TripLoadState();
}

final class TripNotLoaded extends TripLoadState {
  const TripNotLoaded();
}

final class TripLoading extends TripLoadState {
  const TripLoading();
}

final class TripLoaded extends TripLoadState {
  const TripLoaded();
}

final class TripLoadFailed extends TripLoadState {
  const TripLoadFailed(this.failure);
  final Failure failure;
}
