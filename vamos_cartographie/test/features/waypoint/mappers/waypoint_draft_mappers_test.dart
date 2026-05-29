import 'package:gql_tristate_value/gql_tristate_value.dart';
import 'package:test/test.dart';
import 'package:vamos_cartographie/features/waypoints/data/mappers/waypoint_draft_mappers.dart';
import 'package:vamos_cartographie/graphql/graphql.dart';

import '../../../fixtures/waypoint_fixtures.dart';

void main() {
  // ---------------------------------------------------------------------------
  // WaypointDraftMapper.toGQLUpdateInput — Domaine → GWaypointUpdateInput
  // ---------------------------------------------------------------------------

  group('WaypointDraftMapper.toGQLUpdateInput', () {
    test('lat et lng sont toujours présents', () {
      final draft = domainWaypointDraft(lat: 45.0, lng: 5.0);
      final input = WaypointDraftMapper.toGQLUpdateInput(draft);

      expect(input.lat, Value.present(45.0));
      expect(input.lng, Value.present(5.0));
    });

    test('type est toujours présent', () {
      final draft = domainWaypointDraft(type: GWaypointEnum.SHELTER);
      final input = WaypointDraftMapper.toGQLUpdateInput(draft);

      expect(input.type, Value.present(GWaypointEnum.SHELTER));
    });

    test('lat, lng et type sont tous présents ensemble', () {
      final draft = domainWaypointDraft(
        lat: 45.0,
        lng: 5.0,
        type: GWaypointEnum.SHELTER,
      );
      final input = WaypointDraftMapper.toGQLUpdateInput(draft);

      expect(input.lat, Value.present(45.0));
      expect(input.lng, Value.present(5.0));
      expect(input.type, Value.present(GWaypointEnum.SHELTER));
    });

    test('description présente si non vide', () {
      final draft = domainWaypointDraft(description: 'Nouvelle description');
      final input = WaypointDraftMapper.toGQLUpdateInput(draft);

      expect(input.description, Value.present('Nouvelle description'));
    });

    test('description absente si chaîne vide', () {
      final draft = domainWaypointDraft(description: '');
      final input = WaypointDraftMapper.toGQLUpdateInput(draft);

      expect(input.description, const Value.absent());
    });

    test('title présent si non vide', () {
      final draft = domainWaypointDraft(title: 'Château fort');
      final input = WaypointDraftMapper.toGQLUpdateInput(draft);

      expect(input.title, Value.present('Château fort'));
    });

    test('title absent si chaîne vide', () {
      final draft = domainWaypointDraft(title: '');
      final input = WaypointDraftMapper.toGQLUpdateInput(draft);

      expect(input.title, const Value.absent());
    });

    test('description et title présents simultanément', () {
      final draft = domainWaypointDraft(
        title: 'Mont Blanc',
        description: 'Belle vue',
      );
      final input = WaypointDraftMapper.toGQLUpdateInput(draft);

      expect(input.title, Value.present('Mont Blanc'));
      expect(input.description, Value.present('Belle vue'));
    });

    test('description et title absents simultanément', () {
      final draft = domainWaypointDraft(title: '', description: '');
      final input = WaypointDraftMapper.toGQLUpdateInput(draft);

      expect(input.title, const Value.absent());
      expect(input.description, const Value.absent());
    });
  });
}
