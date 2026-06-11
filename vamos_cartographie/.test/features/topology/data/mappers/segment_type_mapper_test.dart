import 'package:flutter_test/flutter_test.dart';
import 'package:vamos_cartographie/features/topology/data/mappers/segment_type_mapper.dart';
import 'package:vamos_cartographie/features/topology/domain/types/segment_type.dart';
import 'package:vamos_cartographie/graphql/__generated__/schema.schema.gql.dart';

void main() {
  group('SegmentTypeMapper', () {
    // ---------------------------------------------------------------------------
    // SegmentType → GSegmentTypeEnum  (toGQL)
    // ---------------------------------------------------------------------------

    group('SegmentType.toGQL', () {
      // Given a domain SegmentType
      // When toGQL is called
      // Then the corresponding GQL enum value is returned

      const knownMappings = [
        (SegmentType.bike, GSegmentTypeEnum.bike),
        (SegmentType.car, GSegmentTypeEnum.car),
        (SegmentType.boat, GSegmentTypeEnum.boat),
        (SegmentType.walk, GSegmentTypeEnum.walk),
        (SegmentType.train, GSegmentTypeEnum.train),
      ];

      for (final (domainValue, gqlValue) in knownMappings) {
        test('maps $domainValue to $gqlValue', () {
          expect(domainValue.toGQL(), gqlValue);
        });
      }
    });

    // ---------------------------------------------------------------------------
    // GSegmentTypeEnum → SegmentType  (toDomain)
    // ---------------------------------------------------------------------------

    group('GSegmentTypeEnum.toDomain', () {
      // Given a GQL enum value
      // When toDomain is called
      // Then the corresponding domain SegmentType is returned

      const knownMappings = [
        (GSegmentTypeEnum.bike, SegmentType.bike),
        (GSegmentTypeEnum.car, SegmentType.car),
        (GSegmentTypeEnum.boat, SegmentType.boat),
        (GSegmentTypeEnum.walk, SegmentType.walk),
        (GSegmentTypeEnum.train, SegmentType.train),
      ];

      for (final (gqlValue, domainValue) in knownMappings) {
        test('maps $gqlValue to $domainValue', () {
          expect(gqlValue.toDomain(), domainValue);
        });
      }

      test(
        'maps gUnknownEnumValue to SegmentType.bike (valeur de fallback)',
        () {
          // Given a future or unknown enum value from the backend
          // When toDomain is called
          // Then bike is returned as a safe default instead of crashing
          expect(
            GSegmentTypeEnum.gUnknownEnumValue.toDomain(),
            SegmentType.bike,
          );
        },
      );

      test('round-trip: toDomain().toGQL() returns the original value', () {
        // Given any known GSegmentTypeEnum
        // When converted to domain and back to GQL
        // Then the original value is recovered
        for (final (gqlValue, domainValue) in knownMappings) {
          expect(domainValue.toGQL(), gqlValue);
        }
      });
    });
  });
}
