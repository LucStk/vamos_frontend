import 'package:domain_core/domain_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:map_engine/src/mode_engine/slots.dart';
part 'search_result_marker_slot.freezed.dart';

/// Nommé Trace pour ne pas se confondre avec MapSketchSegment (l'objet de la carte).
final class SearchResultMarkerSlot {
  const SearchResultMarkerSlot(this.point);
  final WorldOffset point; // jamais modifiée après construction
}

@freezed
abstract class SearchResultMarker with _$SearchResultMarker {
  const SearchResultMarker._();

  const factory SearchResultMarker({required WorldOffset point}) =
      _SearchResultMarker;
}

const searchResultMarkerSlot = Slot<SearchResultMarkerSlot>(
  'searchResultMarker',
);
