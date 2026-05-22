import 'package:api_client/api_client.dart';
import 'package:gql_tristate_value/gql_tristate_value.dart';
import 'package:latlong2/latlong.dart';
import 'package:test/test.dart';
import 'package:vamos_cartographie/data/mappers/waypoint_mappers.dart';
import 'package:vamos_cartographie/domain/domain.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Helpers GQL
// ─────────────────────────────────────────────────────────────────────────────

GImageFieldsData _image() => const GImageFieldsData(
  url: 'https://cdn/img.jpg',
  fileKey: 'media/img.jpg',
);

GWaypointFieldsData_images _waypointImage() =>
    GWaypointFieldsData_images(image: _image());

GWaypointFieldsData _gqlWaypoint({
  int id = 0,
  double lat = 48.85,
  double lng = 2.35,
  GWaypointEnum type = GWaypointEnum.WAYPOINT,
  String title = 'Mon waypoint',
  String description = 'Une description',
  List<GWaypointFieldsData_images>? images,
}) => GWaypointFieldsData(
  id: id,
  lat: lat,
  lng: lng,
  type: type,
  title: title,
  description: description,
  images: images ?? [_waypointImage()],
);

// ─────────────────────────────────────────────────────────────────────────────
// Tests
// ─────────────────────────────────────────────────────────────────────────────

void main() {
  // ---------------------------------------------------------------------------
  // waypointFromGQL — GQL → Domaine
  // ---------------------------------------------------------------------------

  group('WaypointMapper.waypointFromGQL', () {
    test('mappe les coordonnées, le type, le titre et la description', () {
      final gql = _gqlWaypoint(
        id: 2,
        lat: 43.0,
        lng: 1.5,
        type: GWaypointEnum.CAMPING,
        title: 'Bivouac',
        description: 'Camping sympa',
      );
      final wp = WaypointMapper.waypointFromGQL(gql);

      expect(wp.id, 2);
      expect(wp.latLng.latitude, 43.0);
      expect(wp.latLng.longitude, 1.5);
      expect(wp.type, GWaypointEnum.CAMPING);
      expect(wp.title, 'Bivouac');
      expect(wp.description, 'Camping sympa');
    });

    // BUG: WaypointMapper.waypointFromGQL ne mappe pas les images.
    // Même si le fragment GQL contient des images, elles sont ignorées et
    // wp.images revient toujours à la liste vide par défaut du constructeur
    // Waypoint. Ce test documente ce comportement en l'état.
    test('les images NE sont PAS mappées (bug connu)', () {
      final gql = _gqlWaypoint(images: [_waypointImage(), _waypointImage()]);
      final wp = WaypointMapper.waypointFromGQL(gql);

      // Le fragment GQL contient 2 images, mais le mapper ne les transfère pas.
      expect(wp.images, isEmpty);
    });

    test('liste vide si aucune image dans le fragment GQL', () {
      final gql = _gqlWaypoint(images: []);
      expect(WaypointMapper.waypointFromGQL(gql).images, isEmpty);
    });
  });

  // ---------------------------------------------------------------------------
  // waypointToGQLInput — Domaine → GWaypointInput (mutation create)
  // ---------------------------------------------------------------------------

  group('WaypointMapper.waypointToGQLInput', () {
    test('mappe les coordonnées et le type', () {
      final wp = Waypoint(
        latLng: const LatLng(44.0, 3.0),
        type: GWaypointEnum.WATER,
        description: 'Source',
      );
      final input = WaypointMapper.waypointToGQLInput(wp);

      expect(input.lat, 44.0);
      expect(input.lng, 3.0);
      expect(input.type, GWaypointEnum.WATER);
    });

    test('description présente si non vide', () {
      final wp = Waypoint(
        latLng: const LatLng(44.0, 3.0),
        type: GWaypointEnum.WATER,
        description: 'Source',
      );
      expect(
        WaypointMapper.waypointToGQLInput(wp).description,
        Value.present('Source'),
      );
    });

    test('description absente si chaîne vide', () {
      final wp = Waypoint(
        latLng: const LatLng(0, 0),
        type: GWaypointEnum.WAYPOINT,
        description: '',
      );
      expect(
        WaypointMapper.waypointToGQLInput(wp).description,
        const Value.absent(),
      );
    });

    test('description absente si null', () {
      final wp = Waypoint(
        latLng: const LatLng(0, 0),
        type: GWaypointEnum.WAYPOINT,
        description: null,
      );
      expect(
        WaypointMapper.waypointToGQLInput(wp).description,
        const Value.absent(),
      );
    });

    test('title présent si non vide', () {
      final wp = Waypoint(
        latLng: const LatLng(0, 0),
        type: GWaypointEnum.VIEWPOINT,
        title: 'Belvédère',
      );
      expect(
        WaypointMapper.waypointToGQLInput(wp).title,
        Value.present('Belvédère'),
      );
    });

    test('title absent si chaîne vide', () {
      final wp = Waypoint(
        latLng: const LatLng(0, 0),
        type: GWaypointEnum.WAYPOINT,
        title: '',
      );
      expect(WaypointMapper.waypointToGQLInput(wp).title, const Value.absent());
    });

    test('title absent si null', () {
      final wp = Waypoint(
        latLng: const LatLng(0, 0),
        type: GWaypointEnum.WAYPOINT,
        title: null,
      );
      expect(WaypointMapper.waypointToGQLInput(wp).title, const Value.absent());
    });
  });

  // ---------------------------------------------------------------------------
  // waypointToGQLUpdateInput — Domaine → GWaypointUpdateInput (mutation update)
  // ---------------------------------------------------------------------------

  group('WaypointMapper.waypointToGQLUpdateInput', () {
    test('lat, lng et type sont toujours présents', () {
      final wp = Waypoint(
        latLng: const LatLng(45.0, 5.0),
        type: GWaypointEnum.SHELTER,
      );
      final input = WaypointMapper.waypointToGQLUpdateInput(wp);

      expect(input.lat, Value.present(45.0));
      expect(input.lng, Value.present(5.0));
      expect(input.type, Value.present(GWaypointEnum.SHELTER));
    });

    test('description présente si non vide', () {
      final wp = Waypoint(
        latLng: const LatLng(0, 0),
        type: GWaypointEnum.WAYPOINT,
        description: 'Nouvelle description',
      );
      expect(
        WaypointMapper.waypointToGQLUpdateInput(wp).description,
        Value.present('Nouvelle description'),
      );
    });

    test('description absente si chaîne vide', () {
      final wp = Waypoint(
        latLng: const LatLng(0, 0),
        type: GWaypointEnum.WAYPOINT,
        description: '',
      );
      expect(
        WaypointMapper.waypointToGQLUpdateInput(wp).description,
        const Value.absent(),
      );
    });

    test('title présent si non vide', () {
      final wp = Waypoint(
        latLng: const LatLng(0, 0),
        type: GWaypointEnum.HISTORIC,
        title: 'Château fort',
      );
      expect(
        WaypointMapper.waypointToGQLUpdateInput(wp).title,
        Value.present('Château fort'),
      );
    });

    test('title absent si chaîne vide', () {
      final wp = Waypoint(
        latLng: const LatLng(0, 0),
        type: GWaypointEnum.WAYPOINT,
        title: '',
      );
      expect(
        WaypointMapper.waypointToGQLUpdateInput(wp).title,
        const Value.absent(),
      );
    });
  });
}
