import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:map_engine/map_engine.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/objects/annotations/search_result_item.dart';

part 'search_result_item_provider.g.dart';

@Riverpod(keepAlive: true, dependencies: [modeSlot])
SearchResultItem? searchResultItem(Ref ref, MapCameraReader camera) {
  final searchResult = ref.watch(modeSlotProvider(searchResultMarkerSlot));

  if (searchResult != null) {
    return SearchResultItem(
      object: MapSearchResult(),
      worldPosition: searchResult.point,
    );
  }
  return null;
}
