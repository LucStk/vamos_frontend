// features/map/presentation/screens/map_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:vamos_cartographie/features/map/application/applications.dart';
import 'package:vamos_cartographie/features/map/presentation/widgets/widgets.dart';
import 'package:vamos_cartographie/features/map/presentation/dialogs/dialogs.dart';

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
        if (!didPop && mapState.isDirty) {
          HandleBackDialog.show(
            context: context,
            onCancel: () {},
            onIgnore: () {
              Navigator.pop(context);
            },
            onSave: () {
              throw Exception("Implémenter onSave de HandleBackDialog");
              if (context.mounted) Navigator.of(context).pop();
            },
          );
        }
      },
      child: const Scaffold(body: Stack(children: [MapView(), MapTopBar()])),
    );
  }
}
