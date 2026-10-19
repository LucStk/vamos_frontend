import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/core/graphql/graphql.dart';

extension LatLngMapper on LatLng {
  GLatLngInput toGQLInput() => GLatLngInput(lat: latitude, lng: longitude);
}

extension GLatLngFieldsMapper on GLatLngFields {
  LatLng toLatLng() => LatLng(lat, lng);
}

extension ListGLatLngFieldsMapper on List<GLatLngFields> {
  List<LatLng> toDomain() => map((m) => LatLng(m.lat, m.lng)).toList();
}

extension ListLatLngMapper on List<LatLng> {
  List<GLatLngInput> toGQLInput() => map((m) => m.toGQLInput()).toList();
}
