import 'package:flutter_test/flutter_test.dart';
import 'package:latlong2/latlong.dart';
import 'package:domain_core/id.dart';
import 'package:trip_domain/domain/domain.dart';
import 'package:vamos_cartographie/features/map_editor/commands/commands.dart';
import 'package:vamos_cartographie/features/map_editor/reducers/vertex/vertex_reducer.dart';
import 'package:vamos_cartographie/features/map_ui/domain/state/map_mode.dart';

void main() {
  group('reduceVertex', () {
    final vertexId = Id<Vertex>(1);
    final otherVertexId = Id<Vertex>(2);

    // -------------------------------------------------------------------------
    // État VertexSelected
    // -------------------------------------------------------------------------

    group('depuis VertexSelected', () {
      late VertexSelected vertexSelected;

      setUp(() {
        vertexSelected =
            MapMode.vertexSelected(vertexId: vertexId) as VertexSelected;
      });

      test('StartDragVertex → DraggingVertex avec le même vertexId', () {
        // arrange
        const command = StartDragVertex();

        // act
        final result = reduceVertex(vertexSelected, command);

        // assert
        expect(result.nextState, isA<DraggingVertex>());
        expect((result.nextState as DraggingVertex).vertexId, equals(vertexId));
      });

      test(
        'SelectVertex avec un autre id → VertexSelected avec le nouvel id',
        () {
          // arrange
          final command = SelectVertex(otherVertexId);

          // act
          final result = reduceVertex(vertexSelected, command);

          // assert
          expect(result.nextState, isA<VertexSelected>());
          expect(
            (result.nextState as VertexSelected).vertexId,
            equals(otherVertexId),
          );
        },
      );

      test('SelectVertex avec le même id → VertexSelected avec le même id', () {
        // arrange
        final command = SelectVertex(vertexId);

        // act
        final result = reduceVertex(vertexSelected, command);

        // assert
        expect(result.nextState, isA<VertexSelected>());
        expect((result.nextState as VertexSelected).vertexId, equals(vertexId));
      });

      test('commande inconnue depuis VertexSelected → état inchangé', () {
        // arrange
        final command = SelectWaypoint(Id<Waypoint>(99));

        // act
        final result = reduceVertex(vertexSelected, command);

        // assert
        expect(result.nextState, equals(vertexSelected));
      });

      test('EndDragVertex depuis VertexSelected → état inchangé', () {
        // arrange
        final command = EndDragVertex(vertexId, const LatLng(48.0, 2.0));

        // act
        final result = reduceVertex(vertexSelected, command);

        // assert
        expect(result.nextState, isA<VertexSelected>());
      });
    });

    // -------------------------------------------------------------------------
    // État non VertexSelected (cas passthrough)
    // -------------------------------------------------------------------------

    test('reduceVertex depuis un état non géré → état inchangé', () {
      // arrange
      const segmentSelected = MapMode.segmentSelected(
        segmentId: Id<Segment>(5),
      );
      const command = StartDragVertex();

      // act
      final result = reduceVertex(segmentSelected as MapMode, command);

      // assert
      expect(result.nextState, equals(segmentSelected));
    });
  });
}
