import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:map_engine/domain/domain.dart';
import 'package:map_engine/pointer_events_resolver/pending_tap.dart';

part 'pointer_gesture_state.freezed.dart';

@freezed
abstract class PointerGestureState with _$PointerGestureState {
  const factory PointerGestureState({
    required GestureState gesture,
    PendingTap? pendingTap,
  }) = _PointerGestureState;
}
