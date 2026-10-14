import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/core/graphql/graphql.dart';

extension LatLngMapper on LatLng {
  GLatLngInput toGQLInput() => GLatLngInput(lat: latitude, lng: longitude);
}

extension GLatLngFieldsMapper on GLatLngFields {
  LatLng toLatLng() => LatLng(lat, lng);
}
