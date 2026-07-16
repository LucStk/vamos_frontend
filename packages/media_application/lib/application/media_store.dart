import 'package:domain_core/domain/domain.dart';
import 'package:domain_core/id.dart';
import 'package:media_application/domain/domain.dart';

class MediaStore {
  final GraphCollectionStore<MediaImage> mediaStore;
  Map<Id<dynamic>, List<Id<MediaImage>>> graphStore;
  MediaStore({required this.mediaStore, required this.graphStore});

  MediaStore.initial()
    : graphStore = {},
      mediaStore = const GraphCollectionStore<MediaImage>();

  MediaStore copyWith({GraphCollectionStore<MediaImage>? mediaStore}) {
    return MediaStore(
      mediaStore: mediaStore ?? this.mediaStore,
      graphStore: graphStore,
    );
  }
}

extension MediaStoreActions on MediaStore {
  MediaStore insertPatchMedia(MediaImagePatch patch) {
    final l = graphStore[patch.owner.id];
    if (l == null) {
      graphStore[patch.owner.id] = [patch.id];
    } else {
      graphStore[patch.owner.id]!.add(patch.id);
    }
    return copyWith(mediaStore: mediaStore.insertState(HasPatch(patch: patch)));
  }

  MediaStore removeMedia(MediaId id) {
    final v = mediaStore.getState(id)?.serverValue;
    final ownerId = v?.owner.id;
    graphStore[ownerId]?.remove(id);
    return copyWith(mediaStore: mediaStore.remove(id));
  }

  void setMedia(MediaImage serverMedia) {
    mediaStore.get(serverMedia.id)?.set(serverMedia);
  }

  void rollbackMedia(MediaId wid) => mediaStore.get(wid)?.rollback();

  MediaStore clear() {
    graphStore = {};
    return copyWith(mediaStore: GraphCollectionStore<MediaImage>());
  }
}

extension MediaStoreGetters on MediaStore {
  List<MediaId>? getFromOwner(MediaId mId) {
    return graphStore[mId];
  }
}
