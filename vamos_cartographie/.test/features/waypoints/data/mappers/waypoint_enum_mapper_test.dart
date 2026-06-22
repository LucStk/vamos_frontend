import 'package:flutter_test/flutter_test.dart';
import 'package:vamos_cartographie/backend/backend.dart';
import "package:trip_domain/trip_domain.dart";
import 'package:vamos_cartographie/infrastructure/waypoint/mappers/waypoint_enum_mapper.dart';

void main() {
  group('WaypointEnumMapper', () {
    // ---------------------------------------------------------------------------
    // GPoiCategory → PoiCategory  (toDomain)
    // ---------------------------------------------------------------------------

    group('GPoiCategory.toDomain', () {
      // Given a GQL enum value
      // When toDomain is called
      // Then the corresponding domain PoiCategory is returned

      const knownMappings = [
        (GPoiCategory.START, PoiCategory.start),
        (GPoiCategory.END, PoiCategory.end),
        (GPoiCategory.WAYPOINT, PoiCategory.waypoint),
        (GPoiCategory.WATER, PoiCategory.water),
        (GPoiCategory.FOOD, PoiCategory.food),
        (GPoiCategory.REPAIR, PoiCategory.repair),
        (GPoiCategory.SHELTER, PoiCategory.shelter),
        (GPoiCategory.CAMPING, PoiCategory.camping),
        (GPoiCategory.VIEWPOINT, PoiCategory.viewpoint),
        (GPoiCategory.HISTORIC, PoiCategory.historic),
        (GPoiCategory.BEACH, PoiCategory.beach),
        (GPoiCategory.BOAT, PoiCategory.boat),
        (GPoiCategory.WARNING, PoiCategory.warning),
      ];

      for (final (gqlValue, domainValue) in knownMappings) {
        test('maps $gqlValue to $domainValue', () {
          expect(gqlValue.toDomain(), domainValue);
        });
      }

      test(
        'maps gUnknownEnumValue to PoiCategory.other (valeur inconnue du schéma)',
        () {
          // Given a future or unknown enum value from the backend
          // When toDomain is called
          // Then a safe fallback (other) is returned instead of crashing
          expect(GPoiCategory.gUnknownEnumValue.toDomain(), PoiCategory.other);
        },
      );
    });

    // ---------------------------------------------------------------------------
    // PoiCategory → GPoiCategory  (toGQL)
    // ---------------------------------------------------------------------------

    group('PoiCategory.toGQL', () {
      // Given a domain PoiCategory
      // When toGQL is called
      // Then the corresponding GQL enum value is returned

      const knownMappings = [
        (PoiCategory.start, GPoiCategory.START),
        (PoiCategory.end, GPoiCategory.END),
        (PoiCategory.waypoint, GPoiCategory.WAYPOINT),
        (PoiCategory.water, GPoiCategory.WATER),
        (PoiCategory.food, GPoiCategory.FOOD),
        (PoiCategory.repair, GPoiCategory.REPAIR),
        (PoiCategory.shelter, GPoiCategory.SHELTER),
        (PoiCategory.camping, GPoiCategory.CAMPING),
        (PoiCategory.viewpoint, GPoiCategory.VIEWPOINT),
        (PoiCategory.historic, GPoiCategory.HISTORIC),
        (PoiCategory.beach, GPoiCategory.BEACH),
        (PoiCategory.boat, GPoiCategory.BOAT),
        (PoiCategory.warning, GPoiCategory.WARNING),
      ];

      for (final (domainValue, gqlValue) in knownMappings) {
        test('maps $domainValue to $gqlValue', () {
          expect(domainValue.toGQL(), gqlValue);
        });
      }

      test(
        'throws Exception for PoiCategory.other (non transmissible au backend)',
        () {
          // Given PoiCategory.other, which has no GQL equivalent
          // When toGQL is called
          // Then an Exception is thrown to prevent sending an invalid value
          expect(() => PoiCategory.other.toGQL(), throwsException);
        },
      );

      test('round-trip: toGQL().toDomain() returns the original value', () {
        // Given any known PoiCategory
        // When converted to GQL and back to domain
        // Then the original value is recovered
        for (final (domainValue, _) in knownMappings) {
          expect(domainValue.toGQL().toDomain(), domainValue);
        }
      });
    });
  });
}
