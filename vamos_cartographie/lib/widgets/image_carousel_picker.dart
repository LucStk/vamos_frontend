import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_selector/file_selector.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vamos_cartographie/core/config.dart';
import 'package:vamos_cartographie/core/injection.dart';
import 'package:vamos_cartographie/domain/models.dart';
import 'package:vamos_cartographie/data/repositories/upload_img_repository.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Modèle interne
// ─────────────────────────────────────────────────────────────────────────────

enum _ItemKind { local, remote }

/// Un item du carousel.
/// - [local]  : path absolu sur le device, image pas encore uploadée.
/// - [remote] : fileKey stocké en DB (ex: "uploads/uuid.jpg").
///              L'URL d'affichage est construite à la volée via AppConfig.
class _CarouselItem {
  final _ItemKind kind;

  /// local  → path absolu du fichier sur le device
  /// remote → fileKey (relatif, stocké en DB)
  final String value;

  const _CarouselItem.local(this.value) : kind = _ItemKind.local;
  const _CarouselItem.remote(this.value) : kind = _ItemKind.remote;

  bool get isLocal => kind == _ItemKind.local;

  /// URL utilisable pour afficher l'image.
  /// - local  → path direct (File)
  /// - remote → URL complète construite via AppConfig
  String get displayUrl => isLocal ? value : getIt<AppConfig>().imageUrl(value);
}

// ─────────────────────────────────────────────────────────────────────────────
// Widget public
// ─────────────────────────────────────────────────────────────────────────────

/// Carousel de sélection / affichage d'images.
///
/// Entrée  : [remoteImagesPaths] — liste de fileKeys (ex: "uploads/uuid.jpg")
/// Sortie  : [onChanged]        — liste de fileKeys mise à jour
///
/// Les paths locaux (avant upload) sont gérés en interne.
/// La conversion fileKey → URL d'affichage est faite en interne via AppConfig.
class ImageCarouselPicker extends StatefulWidget {
  /// fileKeys des images déjà uploadées (stockés en DB).
  final List<String> remoteImagesPaths;

  /// Appelé à chaque changement avec la liste mise à jour de fileKeys.
  final void Function(List<String> fileKeys) onChanged;

  final bool readOnly;

  /// Taille des miniatures (largeur = hauteur).
  final double thumbSize;

  const ImageCarouselPicker({
    super.key,
    required this.remoteImagesPaths,
    required this.onChanged,
    this.readOnly = false,
    this.thumbSize = 80,
  });

  @override
  State<ImageCarouselPicker> createState() => _ImageCarouselPickerState();
}

// ─────────────────────────────────────────────────────────────────────────────
// State
// ─────────────────────────────────────────────────────────────────────────────

class _ImageCarouselPickerState extends State<ImageCarouselPicker> {
  late List<_CarouselItem> _items;

  /// path local → progression upload (0.0 .. 1.0)
  final Map<String, double> _uploadProgress = {};

  /// path local → message d'erreur upload
  final Map<String, String> _uploadErrors = {};

  // ── Cycle de vie ──────────────────────────────────────────────────────────

  @override
  void initState() {
    super.initState();
    _items = _buildItems(widget.remoteImagesPaths);
  }

  @override
  void didUpdateWidget(covariant ImageCarouselPicker old) {
    super.didUpdateWidget(old);
    if (old.remoteImagesPaths != widget.remoteImagesPaths) {
      setState(() => _items = _buildItems(widget.remoteImagesPaths));
    }
  }

  // ── Helpers ───────────────────────────────────────────────────────────────

  List<_CarouselItem> _buildItems(List<String> fileKeys) =>
      fileKeys.map(_CarouselItem.remote).toList();

  /// Retourne les fileKeys des images distantes (déjà uploadées).
  List<String> _remoteFileKeys() =>
      _items.where((i) => !i.isLocal).map((i) => i.value).toList();

  /// Notifie le parent avec la liste courante de fileKeys.
  void _notify() => widget.onChanged(_remoteFileKeys());

  // ── Sélection + upload ────────────────────────────────────────────────────

  Future<void> _pickImages() async {
    List<String> picked = [];
    if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
      const typeGroup = XTypeGroup(
        label: 'Images',
        extensions: ['jpg', 'jpeg', 'png', 'gif', 'webp'],
      );
      final files = await openFiles(acceptedTypeGroups: [typeGroup]);
      picked = files.map((f) => f.path).toList();
    } else {
      final picker = ImagePicker();
      final images = await picker.pickMultiImage();
      picked = images.map((x) => x.path).toList();
    }
    if (picked.isEmpty) return;

    // Ajoute les items locaux en attente d'upload
    final newItems = picked.map(_CarouselItem.local).toList();
    setState(() => _items.addAll(newItems));
    // Pas de _notify() ici : les items locaux ne sont pas encore des fileKeys

    for (final item in newItems) {
      _uploadItem(item);
    }
  }

  Future<void> _uploadItem(_CarouselItem item) async {
    final path = item.value;
    final ext = path.split('.').last.toLowerCase();

    setState(() {
      _uploadProgress[path] = 0.0;
      _uploadErrors.remove(path);
    });

    final result = await getIt<UploadImgRepository>().uploadImage(
      File(path),
      ext,
      onProgress: (sent, total) {
        if (!mounted) return;
        setState(() {
          _uploadProgress[path] = total > 0 ? sent / total : 0.0;
        });
      },
    );

    if (!mounted) return;

    // L'index peut avoir bougé si d'autres images ont été supprimées pendant l'upload
    final idx = _items.indexWhere((i) => i.isLocal && i.value == path);

    result.fold(
      (failure) => setState(() {
        _uploadProgress.remove(path);
        _uploadErrors[path] = 'Échec upload';
      }),
      (String fileKey) {
        setState(() {
          _uploadProgress.remove(path);
          _uploadErrors.remove(path);
          if (idx != -1) {
            // On remplace le item local par le fileKey distant
            _items[idx] = _CarouselItem.remote(fileKey);
          }
        });
        _notify();
      },
    );
  }

  void _deleteItem(int idx) {
    final val = _items[idx].value;
    setState(() {
      _uploadProgress.remove(val);
      _uploadErrors.remove(val);
      _items.removeAt(idx);
    });
    _notify();
  }

  // ── Lightbox ──────────────────────────────────────────────────────────────

  void _openLightbox(int initialIndex) {
    showDialog(
      context: context,
      barrierColor: Colors.black87,
      useSafeArea: false,
      builder: (_) =>
          _Lightbox(items: List.from(_items), initialIndex: initialIndex),
    );
  }

  // ── Build ─────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final s = widget.thumbSize;

    if (_items.isEmpty && widget.readOnly) return const SizedBox.shrink();

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (int i = 0; i < _items.length; i++)
          _Thumbnail(
            key: ValueKey(_items[i].value),
            item: _items[i],
            size: s,
            uploadProgress: _uploadProgress[_items[i].value],
            uploadError: _uploadErrors[_items[i].value],
            readOnly: widget.readOnly,
            onTap: () => _openLightbox(i),
            onDelete: () => _deleteItem(i),
            onRetry: () => _uploadItem(_items[i]),
          ),

        if (!widget.readOnly) _AddButton(size: s, onTap: _pickImages),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Miniature
// ─────────────────────────────────────────────────────────────────────────────

class _Thumbnail extends StatelessWidget {
  final _CarouselItem item;
  final double size;
  final double? uploadProgress;
  final String? uploadError;
  final bool readOnly;
  final VoidCallback onTap;
  final VoidCallback onDelete;
  final VoidCallback onRetry;

  const _Thumbnail({
    super.key,
    required this.item,
    required this.size,
    required this.uploadProgress,
    required this.uploadError,
    required this.readOnly,
    required this.onTap,
    required this.onDelete,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
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
              _buildImage(),

              // ── Spinner upload ──
              if (uploadProgress != null && uploadError == null)
                const ColoredBox(
                  color: Colors.black45,
                  child: Center(
                    child: SizedBox(
                      width: 28,
                      height: 28,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.5,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

              // ── Erreur upload ──
              if (uploadError != null)
                ColoredBox(
                  color: Colors.black54,
                  child: Center(
                    child: GestureDetector(
                      onTap: onRetry,
                      child: const Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.refresh, color: Colors.white, size: 22),
                          SizedBox(height: 2),
                          Text(
                            'Réessayer',
                            style: TextStyle(color: Colors.white, fontSize: 9),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

              // ── Bouton suppression ──
              if (!readOnly && uploadProgress == null)
                Positioned(
                  top: 4,
                  right: 4,
                  child: GestureDetector(
                    onTap: onDelete,
                    child: Container(
                      width: 22,
                      height: 22,
                      decoration: const BoxDecoration(
                        color: Colors.black54,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 14,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    if (item.isLocal) {
      return Image.file(
        File(item.value),
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => _errorPlaceholder(),
      );
    }
    // item.displayUrl construit l'URL complète via AppConfig
    return Image.network(
      item.displayUrl,
      fit: BoxFit.cover,
      loadingBuilder: (_, child, prog) {
        if (prog == null) return child;
        return const Center(
          child: SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(strokeWidth: 2),
          ),
        );
      },
      errorBuilder: (_, __, ___) => _errorPlaceholder(),
    );
  }

  Widget _errorPlaceholder() => Container(
    color: Colors.grey.shade200,
    child: Icon(
      Icons.broken_image_outlined,
      size: 28,
      color: Colors.grey.shade400,
    ),
  );
}

// ─────────────────────────────────────────────────────────────────────────────
// Bouton "+"
// ─────────────────────────────────────────────────────────────────────────────

class _AddButton extends StatelessWidget {
  final double size;
  final VoidCallback onTap;

  const _AddButton({required this.size, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: size,
        height: size,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.grey.shade400,
              width: 1.5,
              style: BorderStyle.solid,
            ),
            color: Colors.grey.shade50,
          ),
          child: Icon(
            Icons.add_photo_alternate_outlined,
            size: size * 0.4,
            color: Colors.grey.shade500,
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Lightbox fullscreen
// ─────────────────────────────────────────────────────────────────────────────

class _Lightbox extends StatefulWidget {
  final List<_CarouselItem> items;
  final int initialIndex;

  const _Lightbox({required this.items, required this.initialIndex});

  @override
  State<_Lightbox> createState() => _LightboxState();
}

class _LightboxState extends State<_Lightbox> {
  late final PageController _ctrl;
  late int _index;

  @override
  void initState() {
    super.initState();
    _index = widget.initialIndex;
    _ctrl = PageController(initialPage: _index);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  void _prev() {
    if (_index > 0) {
      _ctrl.previousPage(
        duration: const Duration(milliseconds: 280),
        curve: Curves.easeInOut,
      );
    }
  }

  void _next() {
    if (_index < widget.items.length - 1) {
      _ctrl.nextPage(
        duration: const Duration(milliseconds: 280),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        fit: StackFit.expand,
        children: [
          PageView.builder(
            controller: _ctrl,
            itemCount: widget.items.length,
            onPageChanged: (i) => setState(() => _index = i),
            itemBuilder: (_, i) => _buildPage(widget.items[i]),
          ),

          if (_index > 0)
            Positioned(
              left: 12,
              top: 0,
              bottom: 0,
              child: Center(
                child: _LightboxArrow(icon: Icons.chevron_left, onTap: _prev),
              ),
            ),

          if (_index < widget.items.length - 1)
            Positioned(
              right: 12,
              top: 0,
              bottom: 0,
              child: Center(
                child: _LightboxArrow(icon: Icons.chevron_right, onTap: _next),
              ),
            ),

          Positioned(
            bottom: 24,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(99),
                ),
                child: Text(
                  '${_index + 1} / ${widget.items.length}',
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ),
          ),

          Positioned(
            top: MediaQuery.of(context).padding.top + 8,
            right: 12,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                width: 38,
                height: 38,
                decoration: const BoxDecoration(
                  color: Colors.black54,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.close, color: Colors.white, size: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(_CarouselItem item) {
    final image = item.isLocal
        ? Image.file(File(item.value), fit: BoxFit.contain)
        : Image.network(
            item.displayUrl,
            fit: BoxFit.contain,
            loadingBuilder: (_, child, prog) {
              if (prog == null) return child;
              return const Center(
                child: CircularProgressIndicator(color: Colors.white),
              );
            },
            errorBuilder: (_, __, ___) => const Center(
              child: Icon(
                Icons.broken_image_outlined,
                size: 64,
                color: Colors.white38,
              ),
            ),
          );

    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Center(child: image),
    );
  }
}

class _LightboxArrow extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _LightboxArrow({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 42,
        height: 42,
        decoration: const BoxDecoration(
          color: Colors.black54,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 26),
      ),
    );
  }
}
