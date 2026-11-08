import 'package:stored_file_application/stored_file_application.dart';
import 'package:trip_application/trip_application.dart';
import 'package:user_profile_application/domain/user_profile_model.dart';

class TripBundle {
  TripBundle({
    required this.tripSummary,
    required this.route,
    required this.mobilitySpans,
    required this.editSpans,
    required this.user,
  });

  final UserProfile user;
  final TripSummary tripSummary;
  final RouteRemoteModel? route;
  final Iterable<MobilitySpanRemoteModel> mobilitySpans;
  final Iterable<EditSpan> editSpans;
}

class TripSummary {
  TripSummary({required this.trip, required this.storedFiles});
  final Trip trip;
  final List<StoredFileFields> storedFiles;
}
