import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stored_file_application/stored_file_application.dart';
import 'package:vamos_cartographie/domain_features/stored_file/injection/injection.dart';
import 'package:vamos_cartographie/domain_features/stored_file/presentation/widgets/widgets.dart';

/// Montre [images] en grand, à partir de celle qu'on a touchée, et les laisse
/// défiler du doigt. Chaque image se pince pour zoomer.
Future<void> showImageGallery(
  BuildContext context, {
  required List<StoredFileId> images,
  required int initialIndex,
}) => showDialog<void>(
  context: context,
  builder: (_) => _Gallery(images: images, initialIndex: initialIndex),
);

class _Gallery extends StatefulWidget {
  const _Gallery({required this.images, required this.initialIndex});

  final List<StoredFileId> images;
  final int initialIndex;

  @override
  State<_Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<_Gallery> {
  late final PageController _pages = PageController(
    initialPage: widget.initialIndex,
  );
  late int _page = widget.initialIndex;

  @override
  void dispose() {
    _pages.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      backgroundColor: Colors.black,
      child: Stack(
        children: [
          PageView.builder(
            controller: _pages,
            itemCount: widget.images.length,
            onPageChanged: (page) => setState(() => _page = page),
            itemBuilder: (context, page) => InteractiveViewer(
              maxScale: 5,
              child: _FullImage(fileId: widget.images[page]),
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: IconButton(
                tooltip: 'Fermer',
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
          ),
          if (widget.images.length > 1)
            SafeArea(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Text(
                    '${_page + 1} / ${widget.images.length}',
                    style: const TextStyle(color: Colors.white70),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// L'image entière, au plus grand que l'écran permet.
class _FullImage extends ConsumerWidget {
  const _FullImage({required this.fileId});

  final StoredFileId fileId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final file = ref.watch(storeFileProvider(fileId));

    return Center(
      child: switch (file) {
        StoredFilePatchModel(:final File file) => Image.file(
          file,
          fit: BoxFit.contain,
          errorBuilder: (_, _, _) => const ThumbnailError(),
        ),
        StoredFileRemoteModel(:final String url) => Image.network(
          url,
          fit: BoxFit.contain,
          loadingBuilder: (_, child, progress) =>
              progress == null ? child : const ThumbnailLoading(),
          errorBuilder: (_, _, _) => const ThumbnailError(),
        ),
      },
    );
  }
}
