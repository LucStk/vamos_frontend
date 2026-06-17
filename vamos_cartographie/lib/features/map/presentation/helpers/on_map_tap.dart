import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/features/features.dart';
import 'package:vamos_cartographie/features/map/presentation/notifiers/map_interaction_notifier.dart';
import 'package:vamos_cartographie/features/map/presentation/providers/providers.dart';

void onMapTap(
  WidgetRef ref,
  BuildContext context,
  LatLng latLng,
  Id<Trip> tripId,
) {
  final cursorProvider = ref.watch(mapCursorProvider(tripId).notifier);
  final mapInteraction = ref.watch(mapInteractionProvider.notifier);
  debugPrint("$mapInteraction");
  // cursorProvider.setPosition(latLng);
  // cursorProvider.open();
}
