import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stored_file_application/stored_file_application.dart';
import 'package:vamos_cartographie/features/carousel/widgets/thumbnails/thumbnail_loading.dart';
import 'package:vamos_cartographie/features/carousel/widgets/thumbnails/thumbnails.dart';
import 'package:vamos_cartographie/stored_file/injection/stored_file_queries.dart';

import 'dart:io';

class ThumbnailView extends ConsumerWidget {
  final StoredFileId fileId;
  final double size;
  final VoidCallback? onTap;
  final VoidCallback? onRetry;

  const ThumbnailView({
    super.key,
    required this.fileId,
    required this.size,
    this.onTap,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final file = ref.watch(storeFileProvider(fileId));
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: size,
        height: size,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            fit: StackFit.expand,
            children: [
              switch (file) {
                StoredFilePatchModel(:final File file) => Image.file(
                  file,
                  fit: BoxFit.cover,
                  errorBuilder: (_, _, _) => ThumbnailError(),
                ),
                StoredFileRemoteModel(:final String url) => Image.network(
                  url,
                  fit: BoxFit.cover,
                  loadingBuilder: (_, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const ThumbnailLoading();
                  },
                  errorBuilder: (_, _, _) => ThumbnailError(),
                ),
              },
            ],
          ),
        ),
      ),
    );
  }
}
