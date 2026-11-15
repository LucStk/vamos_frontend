// domain_features/waypoint/data/mappers/stay_mappers.dart
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/waypoint/data/graphql/graphql.dart';

extension GDayNoteDetailsMapper on GDayNoteDetails {
  DayNote toDomain() => DayNote(
    id: DayNoteId(id),
    stayId: stayId == null ? null : StayId(stayId!),
    offset: offset,
    title: title,
    notes: notes,
  );
}

extension GStayDetailsMapper on GStayDetails {
  StayInfo toDomain() => StayInfo(
    id: StayId(id),
    nights: nights,
    dayNotes: [for (final n in dayNotes) n.toDomain()]
      ..sort((a, b) => a.offset.compareTo(b.offset)),
  );
}
