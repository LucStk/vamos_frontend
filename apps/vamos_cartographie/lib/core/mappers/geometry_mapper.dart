import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/core/core.dart';
import 'package:vamos_cartographie/topology/data/graphql/fields/fields.dart';

extension LatLngMapper on LatLng {
  GLatLngInput toGQLInput() => GLatLngInput(lat: latitude, lng: longitude);
}

extension GLatLngFieldsMapper on GLatLngFields {
  LatLng toLatLng() => LatLng(lat, lng);
}
