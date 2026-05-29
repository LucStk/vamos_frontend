import 'package:gql_tristate_value/gql_tristate_value.dart';
import 'package:test/test.dart';
import 'package:vamos_cartographie/features/trips/data/mappers/trip_draft_mappers.dart';
import 'package:vamos_cartographie/features/trips/domain/entities/entities.dart';

import '../../../fixtures/trip_fixtures.dart';

void main() {
  // ---------------------------------------------------------------------------
  // TripDraftMapper.toGQLInput — TripDraft → GTripInput (mutation create)
  //
  // Note : l'implémentation actuelle ne mappe PAS les waypoints ni les segments.
  // ---------------------------------------------------------------------------

  group('TripDraftMapper.toGQLInput', () {
    test('mappe le titre', () {
      final draft = domainTripDraft(title: 'Mon voyage');
      expect(TripDraftMapper.toGQLInput(draft).title, 'Mon voyage');
    });

    test('description présente si non vide', () {
      final draft = domainTripDraft(description: 'Super trip');
      expect(
        TripDraftMapper.toGQLInput(draft).description,
        Value.present('Super trip'),
      );
    });

    test('description absente si chaîne vide', () {
      final draft = domainTripDraft(title: 'Test', description: '');
      expect(
        TripDraftMapper.toGQLInput(draft).description,
        const Value.absent(),
      );
    });

    test('date présente si non null', () {
      final draft = domainTripDraft(date: DateTime(2024, 6, 1));
      expect(
        TripDraftMapper.toGQLInput(draft).date,
        Value.present('2024-06-01'),
      );
    });

    test('date absente si null', () {
      final draft = domainTripDraft(date: null);
      expect(TripDraftMapper.toGQLInput(draft).date, const Value.absent());
    });

    test('date formatée en YYYY-MM-DD (ISO tronqué)', () {
      final draft = domainTripDraft(date: DateTime(2025, 1, 9));
      expect(
        TripDraftMapper.toGQLInput(draft).date,
        Value.present('2025-01-09'),
      );
    });
  });

  // ---------------------------------------------------------------------------
  // TripDraftMapper.toGQLUpdateInput — TripDraft → GTripUpdateInput
  //
  // Note : l'implémentation actuelle ne mappe PAS les waypoints ni les segments.
  // ---------------------------------------------------------------------------

  group('TripDraftMapper.toGQLUpdateInput', () {
    test('title toujours présent', () {
      final draft = TripDraft(title: 'Titre mis à jour');
      expect(
        TripDraftMapper.toGQLUpdateInput(draft).title,
        Value.present('Titre mis à jour'),
      );
    });

    test('title présent même si chaîne vide', () {
      final draft = TripDraft(title: '');
      expect(TripDraftMapper.toGQLUpdateInput(draft).title, Value.present(''));
    });

    test('description présente si non vide', () {
      final draft = TripDraft(title: 'T', description: 'Nouvelle description');
      expect(
        TripDraftMapper.toGQLUpdateInput(draft).description,
        Value.present('Nouvelle description'),
      );
    });

    test('description envoyée comme Value.present(null) si chaîne vide', () {
      final draft = TripDraft(title: 'T', description: '');
      // Une description vide signifie « effacer la description côté serveur »
      // → on envoie null explicitement (Value.present(null)).
      expect(
        TripDraftMapper.toGQLUpdateInput(draft).description,
        const Value.present(null),
      );
    });

    test('date présente si non null', () {
      final draft = TripDraft(title: 'T', date: DateTime(2024, 8, 1));
      expect(
        TripDraftMapper.toGQLUpdateInput(draft).date,
        Value.present('2024-08-01'),
      );
    });

    test('date absente si null', () {
      final draft = TripDraft(title: 'T', date: null);
      expect(
        TripDraftMapper.toGQLUpdateInput(draft).date,
        const Value.absent(),
      );
    });

    test('date formatée en YYYY-MM-DD (ISO tronqué)', () {
      final draft = TripDraft(title: 'T', date: DateTime(2025, 3, 15));
      expect(
        TripDraftMapper.toGQLUpdateInput(draft).date,
        Value.present('2025-03-15'),
      );
    });
  });
}
