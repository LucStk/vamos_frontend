// features/map/presentation/screens/map_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:vamos_cartographie/features/map/presentation/providers/map_notifier.dart';
import "utils/handle_back.dart";
import "map_body.dart";

class MapScreen extends ConsumerWidget {
  final int tripId;
  final bool isOwner;

  const MapScreen({super.key, required this.tripId, this.isOwner = true});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProviderScope(
      overrides: [currentTripIdProvider.overrideWithValue(tripId)],
      child: _MapScreenView(),
    );
  }
}

class _MapScreenView extends ConsumerWidget {
  const _MapScreenView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tripId = ref.watch(currentTripIdProvider);
    final mapState = ref.watch(mapStateProvider(tripId));
    return PopScope(
      canPop: !mapState.isDirty,
      onPopInvokedWithResult: (didPop, _) async {
        if (!didPop) {
          await handleBack(context, ref, tripId);
        }
      },
      child: const MapBody(),
    );
  }
}
