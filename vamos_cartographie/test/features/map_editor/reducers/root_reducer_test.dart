import 'package:flutter_test/flutter_test.dart';
import 'package:latlong2/latlong.dart';
import 'package:domain_core/id.dart';
import 'package:map_application/map_application.dart';
import 'package:trip_domain/domain/domain.dart';

void main() {
  group('root_reducer (reduce)', () {
    // -------------------------------------------------------------------------
    // Depuis Idle
    // -------------------------------------------------------------------------

    group('depuis Idle', () {
      const idle = MapMode.idle();

      test('SelectVertex → VertexSelected', () {
        // arrange
        final command = SelectVertex(Id<Vertex>(1));

        // act
        final result = reduce(idle, command);

        // assert
        expect(result.nextState, isA<VertexSelected>());
      });

      test('SelectSegment → SegmentSelected', () {
        // arrange
        final command = SelectSegment(Id<Segment>(2));

        // act
        final result = reduce(idle, command);

        // assert
        expect(result.nextState, isA<SegmentSelected>());
      });

      test('SelectWaypoint → WaypointSelected', () {
        // arrange
        final command = SelectWaypoint(Id<Waypoint>(3));

        // act
        final result = reduce(idle, command);

        // assert
        expect(result.nextState, isA<WaypointSelected>());
      });

      // test('commande inconnue depuis Idle → Idle inchangé', () {
      //   // arrange
      //   const command = StartDragVertex();

      //   // act
      //   final result = reduce(idle, command);

      //   // assert
      //   expect(result.nextState, isA<Idle>());
      // });
    });

    // -------------------------------------------------------------------------
    // Depuis CursorDrawn
    // -------------------------------------------------------------------------

    group('depuis CursorDrawn', () {
      final cursorDrawn = const MapMode.cursorDrawn(
        latLng: LatLng(48.85, 2.35),
      );

      test('toute commande depuis CursorDrawn → état inchangé', () {
        // arrange
        final command = SelectVertex(Id<Vertex>(1));

        // act
        final result = reduce(cursorDrawn, command);

        // assert
        expect(result.nextState, equals(cursorDrawn));
      });
    });

    // -------------------------------------------------------------------------
    // Depuis VertexSelected
    // -------------------------------------------------------------------------

    group('depuis VertexSelected', () {
      final vertexSelected =
          MapMode.vertexSelected(vertexId: Id<Vertex>(1)) as VertexSelected;

      // test('StartDragVertex → DraggingVertex', () {
      //   // arrange
      //   const command = StartDragVertex();

      //   // act
      //   final result = reduce(vertexSelected, command);

      //   // assert
      //   expect(result.nextState, isA<DraggingVertex>());
      // });

      test('SelectVertex (autre id) → VertexSelected mis à jour', () {
        // arrange
        final command = SelectVertex(Id<Vertex>(99));

        // act
        final result = reduce(vertexSelected, command);

        // assert
        expect(result.nextState, isA<VertexSelected>());
        expect(
          (result.nextState as VertexSelected).vertexId,
          equals(Id<Vertex>(99)),
        );
      });
    });

    // -------------------------------------------------------------------------
    // Depuis SegmentSelected
    // -------------------------------------------------------------------------

    group('depuis SegmentSelected', () {
      final segmentSelected =
          MapMode.segmentSelected(segmentId: Id<Segment>(5)) as SegmentSelected;

      test(
        'toute commande depuis SegmentSelected → état inchangé (reducers stub)',
        () {
          // arrange
          final command = SelectVertex(Id<Vertex>(1));

          // act
          final result = reduce(segmentSelected, command);

          // assert — le segment_reducer est un stub qui retourne l'état inchangé
          expect(result.nextState, isA<SegmentSelected>());
        },
      );
    });

    // -------------------------------------------------------------------------
    // Depuis WaypointSelected
    // -------------------------------------------------------------------------

    group('depuis WaypointSelected', () {
      final waypointSelected =
          MapMode.waypointSelected(waypointId: Id<Waypoint>(7))
              as WaypointSelected;

      test(
        'toute commande depuis WaypointSelected → état inchangé (reducers stub)',
        () {
          // arrange
          final command = SelectVertex(Id<Vertex>(1));

          // act
          final result = reduce(waypointSelected, command);

          // assert — le waypoint_reducer est un stub qui retourne l'état inchangé
          expect(result.nextState, isA<WaypointSelected>());
        },
      );
    });
  });
}
