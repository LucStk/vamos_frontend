import 'package:flutter_test/flutter_test.dart';
import 'package:trip_domain/domain/trip.dart';
import 'package:vamos_cartographie/infrastructure/trip/mappers/mappers.dart';

void main() {
  group('TripDraftMapper', () {
    // ---------------------------------------------------------------------------
    // toGQLInput  (création)
    // ---------------------------------------------------------------------------

    group('toGQLInput', () {
      // Given a TripDraft
      // When toGQLInput is called
      // Then the GTripInput reflects the tristate Value rules for optional fields

      test('maps required title', () {
        final draft = TripDraft(title: 'Tour des Vosges');

        final input = TripDraftMapper.toGQLInput(draft);

        expect(input.title, 'Tour des Vosges');
      });

      test('includes description when non-empty', () {
        final draft = TripDraft(
          title: 'Test',
          description: 'Une belle description',
        );

        final input = TripDraftMapper.toGQLInput(draft);

        expect(input.description.isPresent, isTrue);
        expect(input.description.requireValue, 'Une belle description');
      });

      test('omits description when empty', () {
        // Given an empty description
        // When toGQLInput is called
        // Then description is absent (not sent to the server)
        final draft = TripDraft(title: 'Test', description: '');

        final input = TripDraftMapper.toGQLInput(draft);

        expect(input.description.isPresent, isFalse);
      });

      test('includes date formatted as yyyy-MM-dd when present', () {
        final draft = TripDraft(title: 'Test', date: DateTime(2024, 6, 15));

        final input = TripDraftMapper.toGQLInput(draft);

        expect(input.date.isPresent, isTrue);
        expect(input.date.requireValue, '2024-06-15');
      });

      test('omits date when null', () {
        final draft = TripDraft(title: 'Test', date: null);

        final input = TripDraftMapper.toGQLInput(draft);

        expect(input.date.isPresent, isFalse);
      });

      test('date keeps only yyyy-MM-dd part (ignores time component)', () {
        // DateTime can carry time info; only the date part is sent to the API
        final draft = TripDraft(
          title: 'Test',
          date: DateTime(2024, 12, 31, 23, 59, 59),
        );

        final input = TripDraftMapper.toGQLInput(draft);

        expect(input.date.requireValue, '2024-12-31');
      });
    });

    // ---------------------------------------------------------------------------
    // toGQLUpdateInput  (mise à jour)
    // ---------------------------------------------------------------------------

    group('toGQLUpdateInput', () {
      // Given a TripDraft
      // When toGQLUpdateInput is called
      // Then title is always present, description can be nulled out, date is optional

      test('always includes title as Value.present', () {
        // An update must always transmit the title to avoid losing it
        final draft = TripDraft(title: 'Titre mis à jour');

        final input = TripDraftMapper.toGQLUpdateInput(draft);

        expect(input.title.isPresent, isTrue);
        expect(input.title.requireValue, 'Titre mis à jour');
      });

      test('sets description to non-null value when non-empty', () {
        final draft = TripDraft(title: 'Test', description: 'Contenu existant');

        final input = TripDraftMapper.toGQLUpdateInput(draft);

        expect(input.description.isPresent, isTrue);
        expect(input.description.requireValue, 'Contenu existant');
      });

      test('sets description to null when empty (efface la description)', () {
        // Given an empty description in update
        // When toGQLUpdateInput is called
        // Then description is present but null, signaling the server to erase it
        final draft = TripDraft(title: 'Test', description: '');

        final input = TripDraftMapper.toGQLUpdateInput(draft);

        expect(input.description.isPresent, isTrue);
        expect(input.description.requireValue, isNull);
      });

      test('includes date formatted as yyyy-MM-dd when present', () {
        final draft = TripDraft(title: 'Test', date: DateTime(2024, 3, 8));

        final input = TripDraftMapper.toGQLUpdateInput(draft);

        expect(input.date.isPresent, isTrue);
        expect(input.date.requireValue, '2024-03-08');
      });

      test('omits date when null', () {
        final draft = TripDraft(title: 'Test', date: null);

        final input = TripDraftMapper.toGQLUpdateInput(draft);

        expect(input.date.isPresent, isFalse);
      });
    });
  });
}
