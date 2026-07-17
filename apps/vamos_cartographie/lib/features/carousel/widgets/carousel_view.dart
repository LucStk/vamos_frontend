import 'package:domain_core/domain_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stored_file_application/application/stored_file_store.dart';
import 'package:vamos_cartographie/stored_file/injection/injection.dart';
import "thumbnails/thumbnail_view.dart";

class ImageCarouselView<T> extends ConsumerWidget {
  final Id<T> id;
  final double thumbSize = 80;

  const ImageCarouselView({super.key, required this.id});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final store = ref.watch(storedFileStoreProvider);
    final files = store.getFromOwner(id);
    final images = files?.map((i) => store.storedFileStore.get(i));

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (final item in images)
          ThumbnailView(
            key: ValueKey(item.fileKey),
            item: item,
            size: thumbSize,
            hasError: item.uploadStatus == UploadStatus.failure,
          ),
      ],
    );
  }
}
