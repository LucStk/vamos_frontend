// lib/injection/network_overlay_provider.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/map/features/network_overlay_type.dart';

part 'network_overlay_provider.g.dart';

@riverpod
class ActiveNetworkOverlays extends _$ActiveNetworkOverlays {
  @override
  Set<NetworkOverlayType> build() => {};

  void toggle(NetworkOverlayType type) {
    if (state.contains(type)) {
      state = {...state}..remove(type);
    } else {
      state = {...state, type};
    }
  }

  bool isActive(NetworkOverlayType type) => state.contains(type);
}
