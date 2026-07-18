import 'package:domain_core/id.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stored_file_application/stored_file_application.dart';
import 'package:vamos_cartographie/stored_file/injection/injection.dart';

import 'thumbnails/thumbnails.dart';

class ImageCarouselPicker<T> extends ConsumerWidget {
  final Id<T> id;
  final double thumbSize = 80;
  const ImageCarouselPicker({super.key, required this.id});

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
        for (final fId in filesId)
          ThumbnailPicker(fileId: fId, size: thumbSize),

        ThumbnailButtonAdd(
          size: thumbSize,
          onTap: () {},
          // onTap: () async {
          //   final picked = await pickImages();
          //   for (File f in picked) {
          //     mediaHandler.uploadPatchImage(id, generatePatchImage(f));
          //   }
          // },
        ),
      ],
    );
  }
}
