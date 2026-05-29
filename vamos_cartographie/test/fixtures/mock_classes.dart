import 'package:ferry/ferry.dart';
import 'package:mocktail/mocktail.dart';
import 'package:vamos_cartographie/features/trips/data/datasources/trip_remote_datasource.dart';
import 'package:vamos_cartographie/features/waypoints/data/datasources/waypoint_remote_datasource.dart';
import 'package:vamos_cartographie/features/media/data/repositories/upload_img_repository.dart';
import 'package:vamos_cartographie/graphql/graphql.dart';

// ── Mocks ────────────────────────────────────────────────────────────────────

class MockFerryClient extends Mock implements Client {}

class MockTripRemoteDatasource extends Mock implements TripRemoteDatasource {}

class MockWaypointRemoteDatasource extends Mock
    implements WaypointRemoteDatasource {}

class MockUploadImgRepository extends Mock implements UploadImgRepository {}

// ── Fakes (pour registerFallbackValue) ───────────────────────────────────────

class FakeGGetAllTripsReq extends Fake implements GGetAllTripsReq {}

class FakeGGetTripReq extends Fake implements GGetTripReq {}

class FakeGCreateTripReq extends Fake implements GCreateTripReq {}

class FakeGUpdateTripReq extends Fake implements GUpdateTripReq {}

class FakeGDeleteTripReq extends Fake implements GDeleteTripReq {}

class FakeGDeleteImageFromTripReq extends Fake
    implements GDeleteImageFromTripReq {}

class FakeGTripInput extends Fake implements GTripInput {}

class FakeGTripUpdateInput extends Fake implements GTripUpdateInput {}

class FakeGUpdateWaypointReq extends Fake implements GUpdateWaypointReq {}

class FakeGWaypointUpdateInput extends Fake implements GWaypointUpdateInput {}
