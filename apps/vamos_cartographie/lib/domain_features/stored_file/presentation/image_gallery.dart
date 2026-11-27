import 'dart:async';
import 'dart:io';

import 'package:domain_core/domain_core.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stored_file_application/stored_file_application.dart';
import 'package:vamos_cartographie/domain_features/stored_file/injection/injection.dart';
import 'package:vamos_cartographie/domain_features/stored_file/presentation/image_editor.dart';
import 'package:vamos_cartographie/domain_features/stored_file/presentation/widgets/widgets.dart';

/// Longueur maximale d'une légende (celle du serveur).
const _captionMaxLength = 200;

/// Montre [images] en grand, à partir de celle qu'on a touchée, et les laisse
/// défiler du doigt. Chaque image se pince pour zoomer, et sa légende, s'il y
/// en a une, s'affiche en bas.
///
/// Avec [ownerId] et [ownerType], c'est la galerie de celui qui possède les
/// images : elle suit leur liste en direct, permet de les retoucher et d'écrire
/// leur légende.
Future<void> showImageGallery(
  BuildContext context, {
  required List<StoredFileId> images,
  required int initialIndex,
  Id? ownerId,
  TargetType? ownerType,
}) => showDialog<void>(
  context: context,
  builder: (_) => _Gallery(
    images: images,
    initialIndex: initialIndex,
    ownerId: ownerId,
    ownerType: ownerType,
  ),
);

class _Gallery extends ConsumerStatefulWidget {
  const _Gallery({
    required this.images,
    required this.initialIndex,
    this.ownerId,
    this.ownerType,
  });

  final List<StoredFileId> images;
  final int initialIndex;
  final Id? ownerId;
  final TargetType? ownerType;

  bool get editable => ownerId != null && ownerType != null;

  @override
  ConsumerState<_Gallery> createState() => _GalleryState();
}

class _GalleryState extends ConsumerState<_Gallery> {
  late final PageController _pages = PageController(
    initialPage: widget.initialIndex,
  );
  late int _page = widget.initialIndex;

  @override
  void dispose() {
    _pages.dispose();
    super.dispose();
  }

  Future<void> _editCaption(StoredFileId id) async {
    final caption = await showDialog<String>(
      context: context,
      builder: (_) =>
          _CaptionDialog(initial: ref.read(storeFileProvider(id)).caption),
    );
    if (caption == null || !mounted) return;
    unawaited(
      ref
          .read(storedFileStoreProvider.notifier)
          .setCaption(id: id, caption: caption),
    );
  }

  /// Retouche l'image puis la remplace : la nouvelle part au serveur et prend
  /// la place (et la légende) de l'ancienne. On revient à la grille, où sa
  /// vignette montre l'envoi.
  Future<void> _edit(StoredFileId id) async {
    final file = ref.read(storeFileProvider(id));
    if (file is! StoredFileRemoteModel) return;

    final edited = await editImage(context, url: file.url);
    if (edited == null || !mounted) return;

    final notifier = ref.read(storedFileStoreProvider.notifier);
    final ownerId = widget.ownerId!;
    final ownerType = widget.ownerType!;
    Navigator.of(context).pop();
    unawaited(
      notifier.uploadFile(
        targetId: ownerId,
        targetType: ownerType,
        file: edited,
        replacing: id,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final images = widget.editable
        ? ref.watch(
            storedFileStoreProvider.select(
              (s) => s.getFromOwner(widget.ownerId!),
            ),
          )
        : widget.images;

    if (images.isEmpty) {
      // La dernière image vient d'être supprimée : plus rien à montrer.
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) Navigator.of(context).pop();
      });
      return const SizedBox.shrink();
    }

    final current = images[_page < images.length ? _page : images.length - 1];
    final file = ref.watch(storeFileProvider(current));
    // Une image encore en envoi n'est ni attachée ni légendée.
    final canEdit = widget.editable && file is StoredFileRemoteModel;

    return Dialog.fullscreen(
      backgroundColor: Colors.black,
      child: Stack(
        children: [
          PageView.builder(
            controller: _pages,
            itemCount: images.length,
            onPageChanged: (page) => setState(() => _page = page),
            itemBuilder: (context, page) => InteractiveViewer(
              maxScale: 5,
              child: _FullImage(fileId: images[page]),
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (canEdit)
                    IconButton(
                      tooltip: 'Recadrer, tourner…',
                      icon: const Icon(Icons.crop_rotate, color: Colors.white),
                      onPressed: () => _edit(current),
                    ),
                  IconButton(
                    tooltip: 'Fermer',
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _Footer(
              caption: file.caption,
              onEditCaption: canEdit ? () => _editCaption(current) : null,
              counter: images.length > 1
                  ? '${_page + 1} / ${images.length}'
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}

/// Le bas de l'écran : la légende (qu'on touche pour la modifier, chez le
/// propriétaire) et le compteur, sur un dégradé pour rester lisibles sur
/// n'importe quelle photo.
class _Footer extends StatelessWidget {
  const _Footer({required this.caption, this.onEditCaption, this.counter});

  final String caption;
  final VoidCallback? onEditCaption;
  final String? counter;

  @override
  Widget build(BuildContext context) {
    final hasCaption = caption.isNotEmpty;
    if (!hasCaption && onEditCaption == null && counter == null) {
      return const SizedBox.shrink();
    }

    final style = Theme.of(context).textTheme.bodyLarge?.copyWith(
      color: hasCaption ? Colors.white : Colors.white70,
      fontStyle: hasCaption ? null : FontStyle.italic,
    );

    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.transparent, Colors.black87],
        ),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 32, 24, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (hasCaption || onEditCaption != null)
                InkWell(
                  onTap: onEditCaption,
                  borderRadius: BorderRadius.circular(8),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: Text(
                            hasCaption ? caption : 'Ajouter une légende',
                            textAlign: TextAlign.center,
                            style: style,
                          ),
                        ),
                        if (onEditCaption != null) ...[
                          const SizedBox(width: 8),
                          const Icon(
                            Icons.edit_outlined,
                            color: Colors.white70,
                            size: 18,
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              if (counter != null)
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    counter!,
                    style: const TextStyle(color: Colors.white70),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CaptionDialog extends StatefulWidget {
  const _CaptionDialog({required this.initial});

  final String initial;

  @override
  State<_CaptionDialog> createState() => _CaptionDialogState();
}

class _CaptionDialogState extends State<_CaptionDialog> {
  late final TextEditingController _controller = TextEditingController(
    text: widget.initial,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Légende'),
      content: TextField(
        controller: _controller,
        autofocus: true,
        minLines: 1,
        maxLines: 4,
        maxLength: _captionMaxLength,
        textCapitalization: TextCapitalization.sentences,
        decoration: const InputDecoration(hintText: 'Décrivez cette photo'),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Annuler'),
        ),
        FilledButton(
          onPressed: () => Navigator.of(context).pop(_controller.text),
          child: const Text('Enregistrer'),
        ),
      ],
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
