import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/core/core.dart';
import 'package:vamos_cartographie/features/features.dart';
import 'package:vamos_cartographie/features/graph/graph.dart';

class TopologyLayer extends ConsumerWidget {
  final Id<Trip> tripId;

  const TopologyLayer({super.key, required this.tripId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final graph = ref.watch(tripGraphProvider(tripId));

    return graph.when(
      loading: () => const CircularProgressIndicator(),
      error: (err, _) => Text(err.toString()),
      data: (_) => TopologyContent(tripId: tripId),
    );
  }
}
