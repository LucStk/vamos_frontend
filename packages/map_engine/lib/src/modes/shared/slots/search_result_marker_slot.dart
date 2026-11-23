import 'package:domain_core/domain_core.dart';
import 'package:map_engine/src/domain/domain.dart';
import 'package:map_engine/src/mode_engine/slots.dart';

/// Le curseur : un point posé sur la carte (résultat de recherche, tap, position
/// de l'utilisateur).
///
/// [anchor] est l'élément de route sur lequel il repose, s'il y en a un : un
/// tronçon, ou l'une des deux extrémités. Il change son style et ce que le
/// panneau propose (tracer à partir de là).
final class SearchResultMarker {
  const SearchResultMarker({required this.point, this.anchor});

  final WorldOffset point;
  final HitObject<RouteElements>? anchor;

  /// Le curseur recouvre le départ ou l'arrivée de la route.
  bool get onExtremity => switch (anchor?.object) {
    MapTripStart() || MapTripEnd() => true,
    _ => false,
  };

  @override
  bool operator ==(Object other) =>
      other is SearchResultMarker &&
      other.point.value == point.value &&
      other.anchor?.object == anchor?.object &&
      other.anchor?.point.value == anchor?.point.value;

  @override
  int get hashCode =>
      Object.hash(point.value, anchor?.object, anchor?.point.value);
}

const searchResultMarkerSlot = Slot<SearchResultMarker>('searchResultMarker');
