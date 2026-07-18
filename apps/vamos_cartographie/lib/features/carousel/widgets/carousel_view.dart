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
    final filesId = store.getFromOwner(id);
    if (filesId == null) {
      return SizedBox.shrink();
    }

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (final fId in filesId) ThumbnailView(fileId: fId, size: thumbSize),
      ],
    );
  }
}
