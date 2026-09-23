import 'package:domain_core/id.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stored_file_application/stored_file_application.dart';
import '/domain_features/stored_file/injection/injection.dart';
import '/domain_features/stored_file/services/services.dart';
import 'widgets/widgets.dart';
import "thumbnail_picker.dart";

class ImageCarouselPicker<T> extends ConsumerWidget {
  final Id<T> id;
  final TargetType ownerType;
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
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (final fId in filesId)
          ThumbnailPicker(fileId: fId, size: thumbSize),

        GestureDetector(
          onTap: () async {
            final listFile = await pickImages();
            for (final file in listFile) {
              notifier.uploadFile(
                file: file,
                targetId: id,
                targetType: ownerType,
              );
            }
          },
          child: ThumbnailButtonAdd(size: thumbSize),
        ),
      ],
    );
  }
}
