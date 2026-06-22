import 'package:flutter_test/flutter_test.dart';
import 'package:vamos_cartographie/backend/backend.dart';

import 'package:topology_engine/topology_engine.dart';
import 'package:vamos_cartographie/infrastructure/topology/mappers/mobility_type_mapper.dart';

void main() {
  group('MobilityTypeMapper', () {
    // ---------------------------------------------------------------------------
    // MobilityType → GMobilityType  (toGQL)
    // ---------------------------------------------------------------------------

    group('MobilityType.toGQL', () {
      // Given a domain MobilityType
      // When toGQL is called
      // Then the corresponding GQL enum value is returned

      const knownMappings = [
        (MobilityType.bike, GMobilityType.BIKE),
        (MobilityType.car, GMobilityType.CAR),
        (MobilityType.boat, GMobilityType.BOAT),
        (MobilityType.walk, GMobilityType.WALK),
        (MobilityType.train, GMobilityType.TRAIN),
      ];

      for (final (domainValue, gqlValue) in knownMappings) {
        test('maps $domainValue to $gqlValue', () {
          expect(domainValue.toGQL(), gqlValue);
        });
      }
    });

    // ---------------------------------------------------------------------------
    // GMobilityType → MobilityType  (toDomain)
    // ---------------------------------------------------------------------------

    group('GMobilityType.toDomain', () {
      // Given a GQL enum value
      // When toDomain is called
      // Then the corresponding domain MobilityType is returned

      const knownMappings = [
        (GMobilityType.BIKE, MobilityType.bike),
        (GMobilityType.CAR, MobilityType.car),
        (GMobilityType.BOAT, MobilityType.boat),
        (GMobilityType.WALK, MobilityType.walk),
        (GMobilityType.TRAIN, MobilityType.train),
      ];

      for (final (gqlValue, domainValue) in knownMappings) {
        test('maps $gqlValue to $domainValue', () {
          expect(gqlValue.toDomain(), domainValue);
        });
      }

      test(
        'maps gUnknownEnumValue to MobilityType.bike (valeur de fallback)',
        () {
          // Given a future or unknown enum value from the backend
          // When toDomain is called
          // Then bike is returned as a safe default instead of crashing
          expect(GMobilityType.gUnknownEnumValue.toDomain(), MobilityType.bike);
        },
      );
      test('round-trip: toDomain().toGQL() returns the original value', () {
        // Given any known GMobilityType
        // When converted to domain and back to GQL
        // Then the original value is recovered
        for (final (gqlValue, domainValue) in knownMappings) {
          expect(domainValue.toGQL(), gqlValue);
        }
      });
    });
  });
}
