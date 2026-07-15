import 'package:domain_core/domain/collection_store.dart';
import 'package:domain_core/id.dart';
import 'package:media_application/domain/domain.dart';

class MediaStore {
  final GraphCollectionStore<MediaImage> mediaStore;
  final Map<Id<dynamic>, Id<MediaImage>> graphStore;
  MediaStore({required this.mediaStore, required this.graphStore});

  MediaStore.initial()
    : graphStore = {},
      mediaStore = const GraphCollectionStore<MediaImage>();

  MediaStore copyWith(GraphCollectionStore<MediaImage> mediaStore) {
    return MediaStore(mediaStore: mediaStore, graphStore: graphStore);
  }
}

extension MediaStoreActions on MediaStore {
  MediaStore insertMedia(MediaImage image) {
    graphStore[image.] = image.id;
    return copyWith(
      waypointStore: waypointStore.insertState(
        NodeState<Media>.hasPatch(
          patch: waypoint.createPatch(),
          originalValue: waypoint,
        ),
      ),
    );
  }

  MediaStore removeMedia(MediaId id) {
    // on supprime le vertexId associé
    final wState = waypointStore.getState(id)?.serverValue;
    final vertexId = wState?.vertexId;
    vertexIndex.remove(vertexId);
    return copyWith(waypointStore: waypointStore.remove(id));
  }

  void setMedia(Media serverMedia) {
    waypointStore.get(serverMedia.id)?.set(serverMedia);
  }

  void rollbackMedia(MediaId wid) => waypointStore.get(wid)?.rollback();

  MediaStore clear() {
    vertexIndex = {};
    return copyWith(waypointStore: GraphCollectionStore<Media>());
  }
}

extension MediaStoreGetters on MediaStore {
  MediaId? getFromVertex(VertexId vertexId) {
    return vertexIndex[vertexId];
  }
}
