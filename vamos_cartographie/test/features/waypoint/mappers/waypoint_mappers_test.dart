import 'package:latlong2/latlong.dart';
import 'package:test/test.dart';
import 'package:vamos_cartographie/features/waypoints/data/mappers/waypoint_mappers.dart';
import 'package:vamos_cartographie/features/waypoints/domain/domain.dart';
import 'package:vamos_cartographie/graphql/graphql.dart';

import '../../../fixtures/waypoint_fixtures.dart';

void main() {
  // ---------------------------------------------------------------------------
  // WaypointMapper.fromGQL — GQL → Domaine
  // ---------------------------------------------------------------------------

  group('WaypointMapper.fromGQL', () {
    test('mappe l\'id correctement', () {
      final gql = gWaypointData(id: 42);
      expect(WaypointMapper.fromGQL(gql).id, 42);
    });

    test('mappe les coordonnées lat/lng', () {
      final gql = gWaypointData(lat: 43.0, lng: 1.5);
      final wp = WaypointMapper.fromGQL(gql);

      expect(wp.latLng.latitude, 43.0);
      expect(wp.latLng.longitude, 1.5);
    });

    test('mappe le type GWaypointEnum', () {
      final gql = gWaypointData(type: GWaypointEnum.CAMPING);
      expect(WaypointMapper.fromGQL(gql).type, WaypointType.camping);
    });

    test('mappe le titre', () {
      final gql = gWaypointData(title: 'Bivouac');
      expect(WaypointMapper.fromGQL(gql).title, 'Bivouac');
    });

    test('mappe la description', () {
      final gql = gWaypointData(description: 'Camping sympa');
      expect(WaypointMapper.fromGQL(gql).description, 'Camping sympa');
    });

    test('mappe les champs de base en une seule assertion', () {
      final gql = gWaypointData(
        id: 2,
        lat: 43.0,
        lng: 1.5,
        type: GWaypointEnum.CAMPING,
        title: 'Bivouac',
        description: 'Camping sympa',
      );
      final wp = WaypointMapper.fromGQL(gql);

      expect(wp.id, 2);
      expect(wp.latLng, const LatLng(43.0, 1.5));
      expect(wp.type, WaypointType.camping);
      expect(wp.title, 'Bivouac');
      expect(wp.description, 'Camping sympa');
    });

    // Le mapper WaypointMapper.fromGQL ne transfère pas les images du fragment
    // GQL vers le domaine — les images restent vides même si le GQL en contient.
    test('les images NE sont PAS mappées (comportement actuel)', () {
      final image = GWaypointFieldsData_images(
        image: const GImageFieldsData(
          url: 'https://cdn/img.jpg',
          fileKey: 'media/img.jpg',
        ),
      );
      final gql = gWaypointData(images: [image, image]);
      final wp = WaypointMapper.fromGQL(gql);

      expect(wp.images, isEmpty);
    });

    test('liste d\'images vide quand le fragment n\'en contient aucune', () {
      final gql = gWaypointData(images: []);
      expect(WaypointMapper.fromGQL(gql).images, isEmpty);
    });
  });
}
