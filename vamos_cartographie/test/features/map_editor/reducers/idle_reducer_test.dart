import 'package:flutter_test/flutter_test.dart';
import 'package:domain_core/id.dart';
import 'package:trip_domain/domain/domain.dart';
import 'package:vamos_cartographie/features/map_editor/map_editor.dart';

void main() {
  group('reduceIdle', () {
    const idle = MapMode.idle();

    // -------------------------------------------------------------------------
    // SelectVertex
    // -------------------------------------------------------------------------

    test('SelectVertex → VertexSelected avec le bon id', () {
      // arrange
      final vertexId = Id<Vertex>(1);
      final command = SelectVertex(vertexId);

      // act
      final result = reduceIdle(idle, command);

      // assert
      expect(result.nextState, isA<VertexSelected>());
      expect((result.nextState as VertexSelected).vertexId, equals(vertexId));
    });

    // -------------------------------------------------------------------------
    // SelectSegment
    // -------------------------------------------------------------------------

    test('SelectSegment → SegmentSelected avec le bon id', () {
      // arrange
      final segmentId = Id<Segment>(5);
      final command = SelectSegment(segmentId);

      // act
      final result = reduceIdle(idle, command);

      // assert
      expect(result.nextState, isA<SegmentSelected>());
      expect(
        (result.nextState as SegmentSelected).segmentId,
        equals(segmentId),
      );
    });

    // -------------------------------------------------------------------------
    // SelectWaypoint
    // -------------------------------------------------------------------------

    test('SelectWaypoint → WaypointSelected avec le bon id', () {
      // arrange
      final waypointId = Id<Waypoint>(10);
      final command = SelectWaypoint(waypointId);

      // act
      final result = reduceIdle(idle, command);

      // assert
      expect(result.nextState, isA<WaypointSelected>());
      expect(
        (result.nextState as WaypointSelected).waypointId,
        equals(waypointId),
      );
    });

    // -------------------------------------------------------------------------
    // Commandes inconnues → état inchangé
    // -------------------------------------------------------------------------

    test('StartDragVertex depuis Idle → état Idle inchangé', () {
      // arrange
      const command = StartDragVertex();

      // act
      final result = reduceIdle(idle, command);

      // assert
      expect(result.nextState, isA<Idle>());
    });

    test('OpenEditWaypointDialog depuis Idle → état Idle inchangé', () {
      // arrange
      final command = OpenEditWaypointDialog(Id<Waypoint>(1));

      // act
      final result = reduceIdle(idle, command);

      // assert
      expect(result.nextState, isA<Idle>());
    });

    // -------------------------------------------------------------------------
    // Effets
    // -------------------------------------------------------------------------

    test('aucun effet produit par défaut depuis Idle', () {
      // arrange
      final command = SelectVertex(Id<Vertex>(1));

      // act
      final result = reduceIdle(idle, command);

      // assert
      expect(result.effects, isEmpty);
    });
  });
}
