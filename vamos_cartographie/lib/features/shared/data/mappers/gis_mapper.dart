import 'package:latlong2/latlong.dart';
import '/core/graphql/graphql.dart';

class GisMapper {
  static LatLng fromGQL(GLatLngFields latLngData) {
    return LatLng(latLngData.lat, latLngData.lng);
  }

  static GLatLngInput toGQL(LatLng latLng) {
    return GLatLngInput(lat: latLng.latitude, lng: latLng.longitude);
  }
}
