import 'package:flutter_test/flutter_test.dart';
import 'package:vamos_cartographie/features/waypoints/data/mappers/waypoint_draft_mappers.dart';
import 'package:vamos_cartographie/features/waypoints/domain/domain.dart';

import 'package:vamos_cartographie/backend/backend.dart';

void main() {
  group('WaypointDraftMapper', () {
    // ---------------------------------------------------------------------------
    // toGQLInput  (création)
    // ---------------------------------------------------------------------------

    group('toGQLInput', () {
      // Given a WaypointDraft
      // When toGQLInput is called
      // Then the GWaypointCreateInput reflects the tristate Value rules

      test('maps required type', () {
        final draft = WaypointDraft(type: WaypointType.water);

        final input = WaypointDraftMapper.toGQLInput(draft, null, null);

        expect(input.type, GWaypointEnum.WATER);
      });

      test('includes title when non-empty', () {
        final draft = WaypointDraft(
          type: WaypointType.water,
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
        final draft = WaypointDraft(type: WaypointType.water, title: '');

        final input = WaypointDraftMapper.toGQLInput(draft, null, null);

        expect(input.title.isPresent, isFalse);
      });

      test('includes description when non-empty', () {
        final draft = WaypointDraft(
          type: WaypointType.food,
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
        final draft = WaypointDraft(type: WaypointType.food, description: '');

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
      // Then type is always present as Value.present

      test('always includes type as Value.present', () {
        // An update must always transmit the type
        final draft = WaypointDraft(type: WaypointType.shelter);

        final input = WaypointDraftMapper.toGQLUpdateInput(draft);

        expect(input.type.isPresent, isTrue);
        expect(input.type.requireValue, GWaypointEnum.SHELTER);
      });

      test('includes title when non-empty', () {
        final draft = WaypointDraft(
          type: WaypointType.waypoint,
          title: 'Étape principale',
        );

        final input = WaypointDraftMapper.toGQLUpdateInput(draft);

        expect(input.title.isPresent, isTrue);
        expect(input.title.requireValue, 'Étape principale');
      });

      test('omits title when empty', () {
        final draft = WaypointDraft(type: WaypointType.waypoint, title: '');

        final input = WaypointDraftMapper.toGQLUpdateInput(draft);

        expect(input.title.isPresent, isFalse);
      });

      test('includes description when non-empty', () {
        final draft = WaypointDraft(
          type: WaypointType.historic,
          description: 'Château médiéval',
        );

        final input = WaypointDraftMapper.toGQLUpdateInput(draft);

        expect(input.description.isPresent, isTrue);
        expect(input.description.requireValue, 'Château médiéval');
      });

      test('omits description when empty', () {
        final draft = WaypointDraft(
          type: WaypointType.historic,
          description: '',
        );

        final input = WaypointDraftMapper.toGQLUpdateInput(draft);

        expect(input.description.isPresent, isFalse);
      });
    });
  });
}
