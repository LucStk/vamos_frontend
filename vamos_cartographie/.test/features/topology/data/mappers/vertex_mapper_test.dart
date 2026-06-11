import 'package:flutter_test/flutter_test.dart';
import 'package:vamos_cartographie/features/topology/data/mappers/vertex_mappers.dart';
import 'package:vamos_cartographie/graphql/shared/__generated__/geo_fields.data.gql.dart';
import 'package:vamos_cartographie/graphql/topology/vertex/__generated__/vertex_fields.data.gql.dart';

void main() {
  group('VertexMapper', () {
    // ---------------------------------------------------------------------------
    // Helpers
    // ---------------------------------------------------------------------------

    GVertexFieldsData buildGQLVertex({
      int id = 1,
      double lat = 48.5,
      double lng = 2.3,
    }) {
      return GVertexFieldsData(
        id: id,
        latLng: GLatLngFieldsData(lat: lat, lng: lng),
      );
    }

    // ---------------------------------------------------------------------------
    // fromGQL
    // ---------------------------------------------------------------------------

    group('fromGQL', () {
      // Given a GVertexFieldsData from the GQL layer
      // When fromGQL is called
      // Then a Vertex with correct id and coordinates is returned

      test('maps id', () {
        final gql = buildGQLVertex(id: 42);

        final vertex = VertexMapper.fromGQL(gql);

        expect(vertex.id, 42);
      });

      test('maps latitude and longitude', () {
        final gql = buildGQLVertex(lat: 43.2965, lng: 5.3698);

        final vertex = VertexMapper.fromGQL(gql);

        expect(vertex.latLng.latitude, 43.2965);
        expect(vertex.latLng.longitude, 5.3698);
      });

      test('maps negative coordinates', () {
        final gql = buildGQLVertex(lat: -22.9068, lng: -43.1729);

        final vertex = VertexMapper.fromGQL(gql);

        expect(vertex.latLng.latitude, -22.9068);
        expect(vertex.latLng.longitude, -43.1729);
      });

      test('maps vertex at origin (0, 0)', () {
        final gql = buildGQLVertex(id: 0, lat: 0.0, lng: 0.0);

        final vertex = VertexMapper.fromGQL(gql);

        expect(vertex.id, 0);
        expect(vertex.latLng.latitude, 0.0);
        expect(vertex.latLng.longitude, 0.0);
      });
    });
  });
}
