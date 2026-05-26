import 'package:dartz/dartz.dart';
import 'package:path/path.dart';
import 'package:vamos_cartographie/features/media/domain/entities/media_image.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Modèle interne
// ─────────────────────────────────────────────────────────────────────────────

enum ItemKind { local, remote }

enum UploadStatus { idle, uploading, success, failure }

/// Un item du carousel.
/// - [local]  : path absolu sur le device, image pas encore uploadée.
/// - [remote] : image distante avec [fileKey] (stocké en DB) et [url] (affichage).
class CarouselItem {
  final ItemKind kind;
  final UploadStatus uploadStatus;
  final double progress;
  final String? error;

  /// local  → path absolu du fichier sur le device
  /// remote → fileKey (relatif, stocké en DB)
  final String fileKey;

  /// URL d'affichage pour les items remote (null pour les items locaux).
  final String? _url;

  const CarouselItem._internal({
    required this.kind,
    required this.fileKey,
    required String? url,
    required this.uploadStatus,
    required this.progress,
    required this.error,
  }) : _url = url;

  factory CarouselItem.local(String fileKey) {
    return CarouselItem._internal(
      kind: ItemKind.local,
      fileKey: fileKey,
      url: null,
      uploadStatus: UploadStatus.idle,
      progress: 0,
      error: null,
    );
  }

  factory CarouselItem.remote(MediaImage image) {
    return CarouselItem._internal(
      kind: ItemKind.remote,
      fileKey: image.fileKey,
      url: image.url,
      uploadStatus: UploadStatus.success,
      progress: 1,
      error: null,
    );
  }

  MediaImage? get remoteImage {
    if (_url == null) return null;
    return MediaImage(fileKey: fileKey, url: _url);
  }

  bool get isLocal => kind == ItemKind.local;
  bool get isRemote => kind == ItemKind.remote;

  String get displayUrl => isLocal ? fileKey : _url!;

  CarouselItem copyWith({
    ItemKind? kind,
    String? fileKey,
    String? url,
    UploadStatus? uploadStatus,
    double? progress,
    String? error,
  }) {
    return CarouselItem._internal(
      kind: kind ?? this.kind,
      fileKey: fileKey ?? this.fileKey,
      url: url ?? _url,
      uploadStatus: uploadStatus ?? this.uploadStatus,
      progress: progress ?? this.progress,
      error: error,
    );
  }
}
