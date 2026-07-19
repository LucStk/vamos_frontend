import 'package:domain_core/id.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stored_file_application/stored_file_application.dart';
import 'package:vamos_cartographie/stored_file/injection/injection.dart';
import 'package:vamos_cartographie/stored_file/services/services.dart';
import 'widgets/widgets.dart';
import "thumbnail_picker.dart";

class ImageCarouselPicker<T> extends ConsumerWidget {
  final Id<T> id;
  final OwnerType ownerType;
  final double thumbSize = 80;
  const ImageCarouselPicker({
    super.key,
    required this.id,
    required this.ownerType,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final store = ref.watch(storedFileStoreProvider);
    final notifier = ref.watch(storedFileStoreProvider.notifier);
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

        GestureDetector(
          onTap: () async {
            final listFile = await pickImages();
            listFile.map(
              (file) => notifier.uploadFile(
                file: file,
                ownerId: id,
                ownerType: ownerType,
              ),
            );
          },
          child: ThumbnailButtonAdd(size: thumbSize),
        ),
      ],
    );
  }
}
