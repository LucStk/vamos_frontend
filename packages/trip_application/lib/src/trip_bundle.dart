import 'package:stored_file_application/stored_file_application.dart';
import 'package:trip_application/trip_application.dart';
import 'package:user_profile_application/domain/user_profile_model.dart';

typedef TripBundle = (
  Trip,
  UserProfile,
  List<StoredFileRemoteModel>,
  RouteRemoteModel?,
  Iterable<RouteSectionRemoteModel>,
);
