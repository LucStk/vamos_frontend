import 'carousel_item.dart';
import "media_image.dart";
// import 'package:vamos_cartographie/features/media/domain/entities/entities.dart';

class CarouselState {
  final List<CarouselItem> items;
  final Map<String, double> uploadProgress;
  final Map<String, String> uploadErrors;

  const CarouselState({
    this.items = const [],
    this.uploadProgress = const {},
    this.uploadErrors = const {},
  });

  CarouselState copyWith({
    List<CarouselItem>? items,
    Map<String, double>? uploadProgress,
    Map<String, String>? uploadErrors,
  }) {
    return CarouselState(
      items: items ?? this.items,
      uploadProgress: uploadProgress ?? this.uploadProgress,
      uploadErrors: uploadErrors ?? this.uploadErrors,
    );
  }

  List<MediaImage> toMediaImages() {
    return items.where((e) => e.isRemote).map((e) => e.remoteImage!).toList();
  }
}
