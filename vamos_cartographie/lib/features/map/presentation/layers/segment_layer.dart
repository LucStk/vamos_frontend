import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/core/core.dart';
import 'package:vamos_cartographie/features/graph/application/selectors/graph_selectors.dart';
import 'package:vamos_cartographie/features/map/presentation/helpers/segment_polyline_builder.dart';
import 'package:vamos_cartographie/features/topology/domain/domain.dart';
import 'package:vamos_cartographie/features/trips/domain/trip.dart';

class SegmentLayer extends ConsumerStatefulWidget {
  final Id<Trip> tripId;
  const SegmentLayer({super.key, required this.tripId});

  @override
  ConsumerState<SegmentLayer> createState() => _SegmentLayerState();
}

class _SegmentLayerState extends ConsumerState<SegmentLayer> {
  final ValueNotifier<LayerHitResult<Id<Segment>>?> _polyLineHitNotifier =
      ValueNotifier(null);

  @override
  void initState() {
    super.initState();
    // 2. Écouter le notifier
    _polyLineHitNotifier.addListener(_onPolylineTap);
  }

  @override
  void dispose() {
    _polyLineHitNotifier.removeListener(_onPolylineTap);
    _polyLineHitNotifier.dispose();
    super.dispose();
  }

  void _onPolylineTap() {
    final hitResult = _polyLineHitNotifier.value;
    if (hitResult == null) return;

    final clickedLines = hitResult.hitValues;

    if (clickedLines.isNotEmpty) {
      final Id<Segment> segmentId = clickedLines.first;

      // 1. Récupérer l'Offset (pixels) du clic
      final Offset tapOffset = hitResult.point;

      // 2. Convertir l'Offset en LatLng grâce à la caméra de la carte
      // (Il te faut un BuildContext accessible ici, par exemple passé en paramètre)
      final mapCamera = MapCamera.of(context);
      final LatLng tapPosition = mapCamera.screenOffsetToLatLng(tapOffset);

      debugPrint("Clic sur le segment : $segmentId");
      debugPrint("Position géographique exacte : $tapPosition");
    }
  }

  @override
  Widget build(BuildContext context) {
    final ids = ref.watch(
      collectionProvider<Segment>(widget.tripId).select((m) => m.keys.toList()),
    );
    final segments = ref.watch(collectionProvider<Segment>(widget.tripId));
    if (segments.isEmpty) {
      return const SizedBox.shrink();
    }
    final List<Polyline<Id<Segment>>> polylines = [];
    for (final id in ids) {
      polylines.add(segmentPolylineBuilder(ref, widget.tripId, id));
    }

    return PolylineLayer<Id<Segment>>(
      hitNotifier: _polyLineHitNotifier,
      polylines: polylines,
    );
  }
}
