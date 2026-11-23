import 'package:latlong2/latlong.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:riverpod/riverpod.dart';
import 'package:vamos_cartographie/domain_features/trip/injection/trip_discovery_provider.dart';
import 'package:vamos_cartographie/map/objects/trip/trip_item.dart';
part 'trips_layer.g.dart';

/// Voyages choisis pour la vue courante (découverte), dessinés avec leur
/// aperçu simplifié à l'échelle de la vue. Les autres voyages chargés restent
/// en mémoire mais ne sont pas dessinés.
@Riverpod(keepAlive: true)
List<TripItem> discoveredTripItems(Ref ref, MapCameraReader camera) {
  final trips = ref.watch(tripDiscoveryProvider.select((s) => s.trips));
  return [
    for (final trip in trips)
      TripItem(
        object: MapTrip(trip.id),
        worldSegments: [
          for (final part in trip.preview)
            ...projectLine<LatLng>(part, camera.latLngToWorldOffset),
        ],
      ),
  ];
}
