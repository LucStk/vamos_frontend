import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/core/core.dart';
import 'package:vamos_cartographie/domain_features/topology/data/graphql/fields/__generated__/geo_fields.data.gql.dart';

extension LatLngMapper on LatLng {
  GLatLngInput toGQLInput() => GLatLngInput(lat: latitude, lng: longitude);
}

extension GLatLngFieldsMapper on GLatLngFields {
  LatLng toLatLng() => LatLng(lat, lng);
}
