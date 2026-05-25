import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_selector/file_selector.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vamos_cartographie/core/injection.dart';
import 'package:vamos_cartographie/features/trips/data/repositories/upload_img_repository.dart';
import 'package:vamos_cartographie/features/trips/domain/entities/trip_image.dart';
import "carousel_thumbnail.dart";
import 'carousel_item.dart';
import "carousel_add_button.dart";
import "carousel_lightbox.dart";

/// Entrée  : [remoteImages] — liste de [TripImage] (fileKey + url)
/// Sortie  : [onChanged]    — liste de [TripImage] mise à jour
///
/// Les paths locaux (avant upload) sont gérés en interne.
/// L'URL d'affichage est fournie directement par le backend via [TripImage.url].
class ImageCarouselPicker extends StatefulWidget {
  /// Images déjà uploadées (stockées en DB), avec fileKey et url.
  final List<TripImage> remoteImages;

  /// Appelé à chaque changement avec la liste mise à jour de [TripImage].
  final void Function(List<TripImage> images) onChanged;

  final bool readOnly;

  /// Taille des miniatures (largeur = hauteur).
  final double thumbSize;

  const ImageCarouselPicker({
    super.key,
    required this.remoteImages,
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
  late List<CarouselItem> _items;

  /// path local → progression upload (0.0 .. 1.0)
  final Map<String, double> _uploadProgress = {};

  /// path local → message d'erreur upload
  final Map<String, String> _uploadErrors = {};

  // ── Cycle de vie ──────────────────────────────────────────────────────────

  @override
  void initState() {
    super.initState();
    _items = _buildItems(widget.remoteImages);
  }

  @override
  void didUpdateWidget(covariant ImageCarouselPicker old) {
    super.didUpdateWidget(old);
    if (old.remoteImages != widget.remoteImages) {
      setState(() => _items = _buildItems(widget.remoteImages));
    }
  }

  // ── Helpers ───────────────────────────────────────────────────────────────

  List<CarouselItem> _buildItems(List<TripImage> images) =>
      images.map(CarouselItem.remote).toList();

  /// Retourne les [TripImage] des images distantes (déjà uploadées).
  List<TripImage> _remoteImages() => _items
      .where((i) => !i.isLocal)
      .map((i) => TripImage(fileKey: i.value, url: i.displayUrl))
      .toList();

  /// Notifie le parent avec la liste courante de [TripImage].
  void _notify() => widget.onChanged(_remoteImages());

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
    final newItems = picked.map(CarouselItem.local).toList();
    setState(() => _items.addAll(newItems));
    // Pas de _notify() ici : les items locaux ne sont pas encore des fileKeys

    for (final item in newItems) {
      _uploadItem(item);
    }
  }

  Future<void> _uploadItem(CarouselItem item) async {
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
      (TripImage image) {
        setState(() {
          _uploadProgress.remove(path);
          _uploadErrors.remove(path);
          if (idx != -1) {
            // On remplace l'item local par l'image distante (fileKey + url)
            _items[idx] = CarouselItem.remote(image);
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
          LightBox(items: List.from(_items), initialIndex: initialIndex),
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
          Thumbnail(
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

        if (!widget.readOnly) AddButton(size: s, onTap: _pickImages),
      ],
    );
  }
}
