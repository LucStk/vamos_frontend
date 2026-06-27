import 'package:flutter/material.dart';
import 'dart:io';
import 'thumbnail_error.dart';
import 'thumbnail_loading.dart';
import "package:media_application/media_application.dart";

import 'package:domain_core/media.dart';

class ThumbnailImage extends StatelessWidget {
  final ImageUiModel item;
  final VoidCallback? onRetry;

  const ThumbnailImage({super.key, required this.item, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return switch (item.imageLocation) {
      LocalPath(:final File file) => Image.file(
        file,
        fit: BoxFit.cover,
        errorBuilder: (_, _, _) => ThumbnailError(onTap: onRetry),
      ),
      RemoteUrl(:final Url url) => Image.network(
        url.value,
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
