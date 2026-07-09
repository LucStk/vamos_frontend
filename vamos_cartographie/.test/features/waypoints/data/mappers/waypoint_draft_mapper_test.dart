import 'package:flutter_test/flutter_test.dart';
import 'package:trip_application/trip_application.dart';

import 'package:vamos_cartographie/backend/backend.dart';
import 'package:vamos_cartographie/infrastructure/waypoint/mappers/waypoint_draft_mappers.dart';

void main() {
  group('WaypointDraftMapper', () {
    // ---------------------------------------------------------------------------
    // toGQLInput  (création)
    // ---------------------------------------------------------------------------

    group('toGQLInput', () {
      // Given a WaypointDraft
      // When toGQLInput is called
      // Then the GWaypointCreateInput reflects the tristate Value rules

      test('maps required poiCategory', () {
        final draft = WaypointDraft(poiCategory: PoiCategory.water);

        final input = WaypointDraftMapper.toGQLInput(draft, null, null);

        expect(input.poiCategory, GPoiCategory.WATER);
      });

      test('includes title when non-empty', () {
        final draft = WaypointDraft(
          poiCategory: PoiCategory.water,
          title: 'Source du moulin',
        );

        final input = WaypointDraftMapper.toGQLInput(draft, null, null);

        expect(input.title.isPresent, isTrue);
        expect(input.title.requireValue, 'Source du moulin');
      });

      test('omits title when empty', () {
        // Given no title provided
        // When toGQLInput is called
        // Then title is absent (not sent to the server)
        final draft = WaypointDraft(poiCategory: PoiCategory.water, title: '');

        final input = WaypointDraftMapper.toGQLInput(draft, null, null);

        expect(input.title.isPresent, isFalse);
      });

      test('includes description when non-empty', () {
        final draft = WaypointDraft(
          poiCategory: PoiCategory.food,
          description: 'Boulangerie ouverte le dimanche',
        );

        final input = WaypointDraftMapper.toGQLInput(draft, null, null);

        expect(input.description.isPresent, isTrue);
        expect(
          input.description.requireValue,
          'Boulangerie ouverte le dimanche',
        );
      });

      test('omits description when empty', () {
        final draft = WaypointDraft(
          poiCategory: PoiCategory.food,
          description: '',
        );

        final input = WaypointDraftMapper.toGQLInput(draft, null, null);

        expect(input.description.isPresent, isFalse);
      });
    });

    // ---------------------------------------------------------------------------
    // toGQLUpdateInput  (mise à jour)
    // ---------------------------------------------------------------------------

    group('toGQLUpdateInput', () {
      // Given a WaypointDraft
      // When toGQLUpdateInput is called
      // Then poiCategory is always present as Value.present

      test('always includes poiCategory as Value.present', () {
        // An update must always transmit the poiCategory
        final draft = WaypointDraft(poiCategory: PoiCategory.shelter);

        final input = WaypointDraftMapper.toGQLUpdateInput(draft);

        expect(input.poiCategory.isPresent, isTrue);
        expect(input.poiCategory.requireValue, GPoiCategory.SHELTER);
      });

      test('includes title when non-empty', () {
        final draft = WaypointDraft(
          poiCategory: PoiCategory.waypoint,
          title: 'Étape principale',
        );

        final input = WaypointDraftMapper.toGQLUpdateInput(draft);

        expect(input.title.isPresent, isTrue);
        expect(input.title.requireValue, 'Étape principale');
      });

      test('omits title when empty', () {
        final draft = WaypointDraft(
          poiCategory: PoiCategory.waypoint,
          title: '',
        );

        final input = WaypointDraftMapper.toGQLUpdateInput(draft);

        expect(input.title.isPresent, isFalse);
      });

      test('includes description when non-empty', () {
        final draft = WaypointDraft(
          poiCategory: PoiCategory.historic,
          description: 'Château médiéval',
        );

        final input = WaypointDraftMapper.toGQLUpdateInput(draft);

        expect(input.description.isPresent, isTrue);
        expect(input.description.requireValue, 'Château médiéval');
      });

      test('omits description when empty', () {
        final draft = WaypointDraft(
          poiCategory: PoiCategory.historic,
          description: '',
        );

        final input = WaypointDraftMapper.toGQLUpdateInput(draft);

        expect(input.description.isPresent, isFalse);
      });
    });
  });
}
