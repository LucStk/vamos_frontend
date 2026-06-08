import 'package:vamos_cartographie/features/media/domain/entities/entities.dart';

// ── Constantes ────────────────────────────────────────────────────────────────

const kTestFileKey = 'media/test.jpg';
const kTestImageUrl = 'https://cdn.example.com/test.jpg';

const kAltFileKey = 'media/alt.jpg';
const kAltImageUrl = 'https://cdn.example.com/alt.jpg';

// ── MediaImage ────────────────────────────────────────────────────────────────

MediaImage mediaImage({
  String fileKey = kTestFileKey,
  String url = kTestImageUrl,
}) => MediaImage(fileKey: fileKey, url: url);

// ── CarouselItem ──────────────────────────────────────────────────────────────

CarouselItem carouselItemRemote({
  String fileKey = kTestFileKey,
  String url = kTestImageUrl,
}) => CarouselItem.remote(
  image: mediaImage(fileKey: fileKey, url: url),
);

CarouselItem carouselItemLocal({
  String fileKey = kTestFileKey,
  UploadStatus uploadStatus = UploadStatus.idle,
  double progress = 0.0,
}) => CarouselItem.local(
  fileKey: fileKey,
  uploadStatus: uploadStatus,
  progress: progress,
);
