import 'package:domain_core/domain/graph_node_state.dart';
import 'package:flutter/material.dart';
import 'thumbnail_error.dart';
import 'thumbnail_loading.dart';
import "package:stored_file_application/stored_file_application.dart";
import 'package:domain_core/domain/patchable.dart';

class ThumbnailImage extends StatelessWidget {
  final StoreFileState item;
  final VoidCallback? onRetry;

  const ThumbnailImage({super.key, required this.item, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return switch (item) {
      HasPatch<StoredFileRemoteModel>(
        :final Patch<StoredFileRemoteModel> patch,
      ) =>
        Image.file(
          (patch as StoredFilePatchModel).file,
          fit: BoxFit.cover,
          errorBuilder: (_, _, _) => ThumbnailError(onTap: onRetry),
        ),
      HasValue<StoredFileRemoteModel>(:final StoredFileRemoteModel value) =>
        Image.network(
          value.url,
          fit: BoxFit.cover,
          loadingBuilder: (_, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return const ThumbnailLoading();
          },
          errorBuilder: (_, _, _) => ThumbnailError(onTap: onRetry),
        ),
    };
  }
}
