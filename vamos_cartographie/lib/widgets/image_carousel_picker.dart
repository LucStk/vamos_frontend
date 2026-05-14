import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_selector/file_selector.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vamos_cartographie/core/injection.dart';
import 'package:vamos_cartographie/repository/upload_img_repository.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Modèle interne représentant un item du carousel
// ─────────────────────────────────────────────────────────────────────────────

enum _ItemKind { local, remote }

class _CarouselItem {
  final _ItemKind kind;

  /// Chemin local (kind == local) ou URL distante (kind == remote).
  final String value;

  const _CarouselItem.local(this.value) : kind = _ItemKind.local;
  const _CarouselItem.remote(this.value) : kind = _ItemKind.remote;

  bool get isLocal => kind == _ItemKind.local;
}

// ─────────────────────────────────────────────────────────────────────────────
// Widget public
// ─────────────────────────────────────────────────────────────────────────────

class ImageCarouselPicker extends StatefulWidget {
  /// Chemins locaux (fichiers en attente d'upload ou ayant échoué).
  final List<String> imagePaths;

  /// URLs distantes déjà uploadées.
  final List<String> imageUrls;

  /// Appelé quand la liste des chemins locaux change.
  final void Function(List<String>) onPathsChanged;

  /// Appelé quand la liste des URLs change (après un upload réussi).
  final void Function(List<String>) onUrlsChanged;

  final bool readOnly;

  const ImageCarouselPicker({
    super.key,
    required this.imagePaths,
    required this.imageUrls,
    required this.onPathsChanged,
    required this.onUrlsChanged,
    this.readOnly = false,
  });

  @override
  State<ImageCarouselPicker> createState() => _ImageCarouselPickerState();
}

// ─────────────────────────────────────────────────────────────────────────────
// State
// ─────────────────────────────────────────────────────────────────────────────

class _ImageCarouselPickerState extends State<ImageCarouselPicker> {
  /// Liste unifiée de tous les items (locaux + distants).
  late List<_CarouselItem> _items;

  final PageController _pageController = PageController();
  int _currentIndex = 0;

  /// index dans _items → progression d'upload (0.0 .. 1.0).
  final Map<int, double> _uploadProgress = {};

  /// index dans _items → message d'erreur d'upload.
  final Map<int, String> _uploadErrors = {};

  // ── Cycle de vie ──────────────────────────────────────────────────────────

  @override
  void initState() {
    super.initState();
    _items = _buildItems(widget.imagePaths, widget.imageUrls);
  }

  @override
  void didUpdateWidget(covariant ImageCarouselPicker old) {
    super.didUpdateWidget(old);
    // Reconstruire la liste seulement si les inputs ont vraiment changé,
    // pour ne pas écraser les items locaux en cours d'upload.
    if (old.imagePaths != widget.imagePaths ||
        old.imageUrls != widget.imageUrls) {
      setState(() {
        _items = _buildItems(widget.imagePaths, widget.imageUrls);
        if (_currentIndex >= _items.length && _items.isNotEmpty) {
          _currentIndex = _items.length - 1;
        }
      });
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // ── Helpers ───────────────────────────────────────────────────────────────

  List<_CarouselItem> _buildItems(List<String> paths, List<String> urls) {
    return [
      ...urls.map(_CarouselItem.remote),
      ...paths.map(_CarouselItem.local),
    ];
  }

  List<String> _localPaths() =>
      _items.where((i) => i.isLocal).map((i) => i.value).toList();

  List<String> _remoteUrls() =>
      _items.where((i) => !i.isLocal).map((i) => i.value).toList();

  // ── Sélection et upload ───────────────────────────────────────────────────

  Future<void> _pickImages() async {
    List<String> picked = [];
    if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
      const typeGroup = XTypeGroup(
        label: 'Images',
        extensions: ['jpg', 'jpeg', 'png', 'gif', 'webp'],
      );
      final files = await openFiles(acceptedTypeGroups: [typeGroup]);
      picked = files.map((x) => x.path).toList();
    } else {
      final picker = ImagePicker();
      final images = await picker.pickMultiImage();
      picked = images.map((x) => x.path).toList();
    }
    if (picked.isEmpty) return;

    // Ajouter les items locaux à la liste et naviguer vers le dernier.
    final newItems = picked.map(_CarouselItem.local).toList();
    setState(() {
      _items.addAll(newItems);
      _currentIndex = _items.length - 1;
    });
    widget.onPathsChanged(_localPaths());

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _items.length - 1,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      }
    });

    // Lancer l'upload de chaque image locale ajoutée.
    for (final item in newItems) {
      _uploadItem(item);
    }
  }

  Future<void> _uploadItem(_CarouselItem item) async {
    // Trouver l'index actuel (peut changer si d'autres suppressions ont eu lieu).
    final idx = _items.indexOf(item);
    if (idx == -1) return; // L'item a déjà été supprimé.

    final path = item.value;
    final extension = path.split('.').last.toLowerCase();

    setState(() {
      _uploadProgress[idx] = 0.0;
      _uploadErrors.remove(idx);
    });

    final result = await getIt<UploadImgRepository>().uploadImage(
      File(path),
      extension,
      onProgress: (sent, total) {
        final currentIdx = _items.indexOf(item);
        if (currentIdx == -1 || !mounted) return;
        setState(() {
          _uploadProgress[currentIdx] = total > 0 ? sent / total : 0.0;
        });
      },
    );

    if (!mounted) return;

    // L'index peut avoir changé depuis le début de l'upload.
    final currentIdx = _items.indexOf(item);
    if (currentIdx == -1) return; // Supprimé pendant l'upload.

    result.fold(
      // ── Échec ──
      (failure) {
        setState(() {
          _uploadProgress.remove(currentIdx);
          _uploadErrors[currentIdx] = 'Échec de l\'upload';
        });
      },
      // ── Succès ──
      (urlOrKey) {
        setState(() {
          _uploadProgress.remove(currentIdx);
          _uploadErrors.remove(currentIdx);
          // Remplacer l'item local par un item distant.
          _items[currentIdx] = _CarouselItem.remote(urlOrKey);
        });
        widget.onPathsChanged(_localPaths());
        widget.onUrlsChanged(_remoteUrls());
      },
    );
  }

  // ── Suppression ───────────────────────────────────────────────────────────

  void _deleteCurrentImage() {
    if (_items.isEmpty) return;
    setState(() {
      _uploadProgress.remove(_currentIndex);
      _uploadErrors.remove(_currentIndex);
      // Reconstruire les maps avec les nouveaux index.
      _rebuildProgressMaps(_currentIndex);
      _items.removeAt(_currentIndex);
      if (_currentIndex >= _items.length && _currentIndex > 0) {
        _currentIndex = _items.length - 1;
      }
    });
    widget.onPathsChanged(_localPaths());
    widget.onUrlsChanged(_remoteUrls());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_pageController.hasClients && _items.isNotEmpty) {
        _pageController.jumpToPage(_currentIndex);
      }
    });
  }

  /// Après suppression à [removedIndex], décale tous les index > removedIndex.
  void _rebuildProgressMaps(int removedIndex) {
    final newProgress = <int, double>{};
    final newErrors = <int, String>{};
    _uploadProgress.forEach((k, v) {
      if (k < removedIndex) newProgress[k] = v;
      if (k > removedIndex) newProgress[k - 1] = v;
    });
    _uploadErrors.forEach((k, v) {
      if (k < removedIndex) newErrors[k] = v;
      if (k > removedIndex) newErrors[k - 1] = v;
    });
    _uploadProgress
      ..clear()
      ..addAll(newProgress);
    _uploadErrors
      ..clear()
      ..addAll(newErrors);
  }

  // ── Build ─────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // ── Bouton d'ajout ──
        if (!widget.readOnly)
          GestureDetector(
            onTap: _pickImages,
            child: Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.shade400,
                  width: 1.5,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade50,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_photo_alternate_outlined,
                    size: 32,
                    color: Colors.grey.shade500,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Appuyer pour ajouter des images',
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                  ),
                  if (_items.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        '${_items.length} image(s) chargée(s)',
                        style: TextStyle(
                          color: Colors.blue.shade600,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),

        // ── Message vide en readOnly ──
        if (widget.readOnly && _items.isEmpty)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey.shade50,
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Column(
              children: [
                Icon(
                  Icons.photo_library_outlined,
                  size: 28,
                  color: Colors.grey.shade400,
                ),
                const SizedBox(height: 6),
                Text(
                  'Aucune photo',
                  style: TextStyle(color: Colors.grey.shade400, fontSize: 13),
                ),
              ],
            ),
          ),

        // ── Carousel ──
        if (_items.isNotEmpty) ...[
          const SizedBox(height: 12),
          SizedBox(
            height: 200,
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Vue principale
                PageView.builder(
                  controller: _pageController,
                  itemCount: _items.length,
                  onPageChanged: (i) => setState(() => _currentIndex = i),
                  itemBuilder: (_, i) => _buildMainImage(i),
                ),

                // Flèche gauche
                Positioned(
                  left: 8,
                  child: _NavButton(
                    icon: Icons.chevron_left,
                    onTap: _currentIndex > 0
                        ? () => _pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          )
                        : null,
                  ),
                ),

                // Flèche droite
                Positioned(
                  right: 8,
                  child: _NavButton(
                    icon: Icons.chevron_right,
                    onTap: _currentIndex < _items.length - 1
                        ? () => _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          )
                        : null,
                  ),
                ),

                // Compteur
                Positioned(
                  bottom: 8,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(99),
                    ),
                    child: Text(
                      '${_currentIndex + 1} / ${_items.length}',
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),

                // Bouton supprimer
                if (!widget.readOnly)
                  Positioned(
                    top: 8,
                    right: 12,
                    child: GestureDetector(
                      onTap: _deleteCurrentImage,
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: const BoxDecoration(
                          color: Colors.black54,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.delete_outline,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),

          // ── Pagination dots ──
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _items.length,
              (i) => AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                margin: const EdgeInsets.symmetric(horizontal: 3),
                width: _currentIndex == i ? 18 : 7,
                height: 7,
                decoration: BoxDecoration(
                  color: _currentIndex == i
                      ? Colors.blue.shade600
                      : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(99),
                ),
              ),
            ),
          ),

          // ── Miniatures ──
          const SizedBox(height: 8),
          SizedBox(
            height: 60,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _items.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (_, i) => GestureDetector(
                onTap: () => _pageController.animateToPage(
                  i,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                ),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: _currentIndex == i
                          ? Colors.blue.shade600
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: _buildThumbnail(i),
                  ),
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }

  // ── Builders d'images ─────────────────────────────────────────────────────

  Widget _buildMainImage(int i) {
    final item = _items[i];
    final progress = _uploadProgress[i];
    final error = _uploadErrors[i];

    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Image
          item.isLocal
              ? Image.file(File(item.value), fit: BoxFit.contain)
              : Image.network(
                  item.value,
                  fit: BoxFit.contain,
                  loadingBuilder: (_, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                  errorBuilder: (_, __, ___) => _ErrorPlaceholder(),
                ),

          // Overlay de progression d'upload
          if (progress != null) _UploadOverlay(progress: progress),

          // Overlay d'erreur d'upload
          if (error != null)
            _ErrorOverlay(message: error, onRetry: () => _uploadItem(item)),
        ],
      ),
    );
  }

  Widget _buildThumbnail(int i) {
    final item = _items[i];
    final progress = _uploadProgress[i];

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          width: 56,
          height: 56,
          child: item.isLocal
              ? Image.file(
                  File(item.value),
                  width: 56,
                  height: 56,
                  fit: BoxFit.cover,
                )
              : Image.network(
                  item.value,
                  width: 56,
                  height: 56,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => _ErrorPlaceholder(small: true),
                ),
        ),
        // Barre de progression en bas de la miniature
        if (progress != null)
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 4,
              backgroundColor: Colors.black26,
              color: Colors.blue.shade400,
            ),
          ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Widgets internes
// ─────────────────────────────────────────────────────────────────────────────

class _NavButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const _NavButton({required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedOpacity(
        opacity: onTap != null ? 1.0 : 0.3,
        duration: const Duration(milliseconds: 200),
        child: Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: Colors.white70,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Icon(icon, size: 20, color: Colors.black87),
        ),
      ),
    );
  }
}

/// Overlay semi-transparent avec barre de progression affiché sur une image
/// en cours d'upload.
class _UploadOverlay extends StatelessWidget {
  final double progress;

  const _UploadOverlay({required this.progress});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black38,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.cloud_upload_outlined,
            color: Colors.white,
            size: 32,
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.white30,
              color: Colors.white,
              minHeight: 6,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            '${(progress * 100).round()} %',
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

/// Overlay affiché en cas d'erreur d'upload, avec bouton de réessai.
class _ErrorOverlay extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const _ErrorOverlay({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, color: Colors.redAccent, size: 32),
          const SizedBox(height: 6),
          Text(
            message,
            style: const TextStyle(color: Colors.white, fontSize: 12),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          TextButton.icon(
            onPressed: onRetry,
            icon: const Icon(Icons.refresh, color: Colors.white, size: 16),
            label: const Text(
              'Réessayer',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              backgroundColor: Colors.white24,
            ),
          ),
        ],
      ),
    );
  }
}

/// Placeholder affiché quand une image réseau ne peut pas être chargée.
class _ErrorPlaceholder extends StatelessWidget {
  final bool small;

  const _ErrorPlaceholder({this.small = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      child: Icon(
        Icons.broken_image_outlined,
        color: Colors.grey.shade400,
        size: small ? 20 : 36,
      ),
    );
  }
}
