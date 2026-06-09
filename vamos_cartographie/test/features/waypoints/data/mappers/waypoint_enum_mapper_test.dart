import 'package:flutter_test/flutter_test.dart';
import 'package:vamos_cartographie/features/waypoints/data/mappers/waypoint_enum_mapper.dart';
import 'package:vamos_cartographie/features/waypoints/domain/types/waypoint_type.dart';
import 'package:vamos_cartographie/graphql/__generated__/schema.schema.gql.dart';

void main() {
  group('WaypointEnumMapper', () {
    // ---------------------------------------------------------------------------
    // GWaypointEnum → WaypointType  (toDomain)
    // ---------------------------------------------------------------------------

    group('GWaypointEnum.toDomain', () {
      // Given a GQL enum value
      // When toDomain is called
      // Then the corresponding domain WaypointType is returned

      const knownMappings = [
        (GWaypointEnum.START, WaypointType.start),
        (GWaypointEnum.END, WaypointType.end),
        (GWaypointEnum.WAYPOINT, WaypointType.waypoint),
        (GWaypointEnum.WATER, WaypointType.water),
        (GWaypointEnum.FOOD, WaypointType.food),
        (GWaypointEnum.REPAIR, WaypointType.repair),
        (GWaypointEnum.SHELTER, WaypointType.shelter),
        (GWaypointEnum.CAMPING, WaypointType.camping),
        (GWaypointEnum.VIEWPOINT, WaypointType.viewpoint),
        (GWaypointEnum.HISTORIC, WaypointType.historic),
        (GWaypointEnum.BEACH, WaypointType.beach),
        (GWaypointEnum.BOAT, WaypointType.boat),
        (GWaypointEnum.WARNING, WaypointType.warning),
      ];

      for (final (gqlValue, domainValue) in knownMappings) {
        test('maps $gqlValue to $domainValue', () {
          expect(gqlValue.toDomain(), domainValue);
        });
      }

      test(
        'maps gUnknownEnumValue to WaypointType.other (valeur inconnue du schéma)',
        () {
          // Given a future or unknown enum value from the backend
          // When toDomain is called
          // Then a safe fallback (other) is returned instead of crashing
          expect(
            GWaypointEnum.gUnknownEnumValue.toDomain(),
            WaypointType.other,
          );
        },
      );
    });

    // ---------------------------------------------------------------------------
    // WaypointType → GWaypointEnum  (toGQL)
    // ---------------------------------------------------------------------------

    group('WaypointType.toGQL', () {
      // Given a domain WaypointType
      // When toGQL is called
      // Then the corresponding GQL enum value is returned

      const knownMappings = [
        (WaypointType.start, GWaypointEnum.START),
        (WaypointType.end, GWaypointEnum.END),
        (WaypointType.waypoint, GWaypointEnum.WAYPOINT),
        (WaypointType.water, GWaypointEnum.WATER),
        (WaypointType.food, GWaypointEnum.FOOD),
        (WaypointType.repair, GWaypointEnum.REPAIR),
        (WaypointType.shelter, GWaypointEnum.SHELTER),
        (WaypointType.camping, GWaypointEnum.CAMPING),
        (WaypointType.viewpoint, GWaypointEnum.VIEWPOINT),
        (WaypointType.historic, GWaypointEnum.HISTORIC),
        (WaypointType.beach, GWaypointEnum.BEACH),
        (WaypointType.boat, GWaypointEnum.BOAT),
        (WaypointType.warning, GWaypointEnum.WARNING),
      ];

      for (final (domainValue, gqlValue) in knownMappings) {
        test('maps $domainValue to $gqlValue', () {
          expect(domainValue.toGQL(), gqlValue);
        });
      }

      test(
        'throws Exception for WaypointType.other (non transmissible au backend)',
        () {
          // Given WaypointType.other, which has no GQL equivalent
          // When toGQL is called
          // Then an Exception is thrown to prevent sending an invalid value
          expect(() => WaypointType.other.toGQL(), throwsException);
        },
      );

      test('round-trip: toGQL().toDomain() returns the original value', () {
        // Given any known WaypointType
        // When converted to GQL and back to domain
        // Then the original value is recovered
        for (final (domainValue, _) in knownMappings) {
          expect(domainValue.toGQL().toDomain(), domainValue);
        }
      });
    });
  });
}
