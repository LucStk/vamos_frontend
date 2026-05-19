import 'package:api_client/api_client.dart';
import 'package:ferry/ferry.dart';
import 'package:flutter/rendering.dart';
import 'package:gql_tristate_value/gql_tristate_value.dart';

class TripRemoteDatasource {
  final Client client;

  TripRemoteDatasource(this.client);

  Future<GCreateTripData_createTrip> createTrip({
    required String title,
    String? description,
    DateTime? date,
  }) async {
    final req = GCreateTripReq(
      vars: GCreateTripVars(
        trip: GTripInput(title: title, description: Value.present(description)),
      ),
    );

    final response = await client.request(req).first;
    if (response.hasErrors || response.data == null) {
      throw Exception();
    }
    return response.data!.createTrip;
  }

  Future<List<GTripFieldsData>> getAllTrips() async {
    final req = GGetAllTripsReq();
    final response = await client.request(req).first;
    if (response.hasErrors || response.data == null) {
      throw Exception();
    }
    return response.data!.trips;
  }

  Future<GGetTripData_trip> getTripById({required int id}) async {
    final req = GGetTripReq(vars: GGetTripVars(id: id));
    final response = await client.request(req).first;
    if (response.hasErrors || response.data == null) {
      throw Exception();
    }
    return response.data!.trip;
  }

  Future<void> deleteTrip({required int id}) async {
    final req = GDeleteTripReq(vars: GDeleteTripVars(id: id));
    final response = await client.request(req).first;
    if (response.hasErrors || response.data == null) {
      throw Exception();
    }
  }

  Future<void> updateTrip({
    required int id,
    required String title,
    String? description,
    DateTime? date,
  }) async {
    final req = GUpdateTripReq(
      vars: GUpdateTripVars(
        id: id,
        trip: GTripUpdateInput(
          title: Value.present(title),
          description: Value.present(description),
        ),
      ),
    );
    final response = await client.request(req).first;
    if (response.hasErrors || response.data == null) {
      throw Exception();
    }
  }
}
