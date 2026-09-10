// lib/layers/network_overlay_layer.dart
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

// lib/layers/network_overlay_layer.dart
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/map/features/network_overlay_type.dart';
import 'package:vamos_cartographie/map/injection/network_overlay_provider.dart';

/// Seul point de la carte à observer activeNetworkOverlaysProvider —
/// un toggle ne reconstruit que ce widget, pas FlutterMap ni ses autres
/// enfants (SegmentLayer, VertexLayer, etc.).
class NetworkOverlayLayer extends ConsumerWidget {
  const NetworkOverlayLayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeOverlays = ref.watch(activeNetworkOverlaysProvider);

    if (activeOverlays.isEmpty) {
      return const SizedBox.shrink();
    }

    return Stack(
      children: [
        for (final type in activeOverlays)
          _SingleNetworkTileLayer(key: ValueKey(type), type: type),
      ],
    );
  }
}

class _SingleNetworkTileLayer extends StatelessWidget {
  final NetworkOverlayType type;
  const _SingleNetworkTileLayer({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return TileLayer(
      urlTemplate: type.urlTemplate,
      userAgentPackageName: 'com.tonapp.vamos_cartographie',
      tileProvider: NetworkTileProvider(),
      maxZoom: 18,
      panBuffer: 1,
    );
  }
}
