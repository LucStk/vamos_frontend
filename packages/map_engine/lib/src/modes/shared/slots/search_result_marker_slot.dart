import 'package:domain_core/domain_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:map_engine/src/mode_engine/slots.dart';
part 'search_result_marker_slot.freezed.dart';

@freezed
abstract class SearchResultMarker with _$SearchResultMarker {
  const SearchResultMarker._();

  const factory SearchResultMarker({required WorldOffset point}) =
      _SearchResultMarker;
}

const searchResultMarkerSlot = Slot<SearchResultMarker>('searchResultMarker');
