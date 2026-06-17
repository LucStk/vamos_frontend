import 'package:flutter_test/flutter_test.dart';
import 'package:vamos_cartographie/core/type/id.dart';
import 'package:vamos_cartographie/features/topology/data/mappers/segment_mappers_draft.dart';
import 'package:vamos_cartographie/features/topology/domain/domain.dart';

import 'package:vamos_cartographie/backend/backend.dart';

void main() {
  group('SegmentDraftMapper', () {
    // ---------------------------------------------------------------------------
    // toGQLInput  (création)
    // ---------------------------------------------------------------------------

    group('toGQLInput', () {
      // Given a SegmentDraft
      // When toGQLInput is called
      // Then a GSegmentCreateInput with all required fields is returned

      test('maps type, startVertexId and endVertexId', () {
        final draft = SegmentDraft(
          type: SegmentType.bike,
          startVertexId: Id<Vertex>(3),
          endVertexId: Id<Vertex>(7),
        );

        final input = SegmentDraftMapper.toGQLInput(draft);

        expect(input.type, GSegmentTypeEnum.bike);
        expect(input.startVertexId, 3);
        expect(input.endVertexId, 7);
      });

      test('maps all segment types', () {
        final types = [
          (SegmentType.bike, GSegmentTypeEnum.bike),
          (SegmentType.car, GSegmentTypeEnum.car),
          (SegmentType.boat, GSegmentTypeEnum.boat),
          (SegmentType.walk, GSegmentTypeEnum.walk),
          (SegmentType.train, GSegmentTypeEnum.train),
        ];

        for (final (domainType, gqlType) in types) {
          final draft = SegmentDraft(
            type: domainType,
            startVertexId: Id<Vertex>(1),
            endVertexId: Id<Vertex>(2),
          );
          final input = SegmentDraftMapper.toGQLInput(draft);
          expect(
            input.type,
            gqlType,
            reason: '$domainType should map to $gqlType',
          );
        }
      });
    });

    // ---------------------------------------------------------------------------
    // toGQLUpdateInput  (mise à jour)
    // ---------------------------------------------------------------------------

    group('toGQLUpdateInput', () {
      // Given a SegmentDraft
      // When toGQLUpdateInput is called
      // Then all fields are wrapped in Value.present

      test('wraps type in Value.present', () {
        final draft = SegmentDraft(
          type: SegmentType.walk,
          startVertexId: Id<Vertex>(1),
          endVertexId: Id<Vertex>(2),
        );

        final input = SegmentDraftMapper.toGQLUpdateInput(draft);

        expect(input.type.isPresent, isTrue);
        expect(input.type.requireValue, GSegmentTypeEnum.walk);
      });

      test('wraps startVertexId in Value.present', () {
        final draft = SegmentDraft(
          type: SegmentType.bike,
          startVertexId: Id<Vertex>(5),
          endVertexId: Id<Vertex>(9),
        );

        final input = SegmentDraftMapper.toGQLUpdateInput(draft);

        expect(input.startVertexId.isPresent, isTrue);
        expect(input.startVertexId.requireValue, 5);
      });

      test('wraps endVertexId in Value.present', () {
        final draft = SegmentDraft(
          type: SegmentType.bike,
          startVertexId: Id<Vertex>(5),
          endVertexId: Id<Vertex>(9),
        );

        final input = SegmentDraftMapper.toGQLUpdateInput(draft);

        expect(input.endVertexId.isPresent, isTrue);
        expect(input.endVertexId.requireValue, 9);
      });

      test('maps all segment types in update', () {
        final types = [
          (SegmentType.bike, GSegmentTypeEnum.bike),
          (SegmentType.car, GSegmentTypeEnum.car),
          (SegmentType.boat, GSegmentTypeEnum.boat),
          (SegmentType.walk, GSegmentTypeEnum.walk),
          (SegmentType.train, GSegmentTypeEnum.train),
        ];

        for (final (domainType, gqlType) in types) {
          final draft = SegmentDraft(
            type: domainType,
            startVertexId: Id<Vertex>(1),
            endVertexId: Id<Vertex>(2),
          );
          final input = SegmentDraftMapper.toGQLUpdateInput(draft);
          expect(
            input.type.requireValue,
            gqlType,
            reason: '$domainType should map to $gqlType',
          );
        }
      });
    });
  });
}
