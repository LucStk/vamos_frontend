import 'carousel_item.dart';
import "media_image.dart";
// import 'package:vamos_cartographie/features/media/domain/entities/entities.dart';

class CarouselState {
  final List<CarouselItem> items;

  const CarouselState({this.items = const []});

  CarouselState copyWith({List<CarouselItem>? items}) {
    return CarouselState(items: items ?? this.items);
  }

  List<MediaImage> get remoteImages {
    return items.where((e) => e.isRemote).map((e) => e.remoteImage!).toList();
  }

  factory CarouselState.fromRemote(List<MediaImage> remoteImages) {
    return CarouselState(
      items: remoteImages
          .map(
            (image) => CarouselItem.remote(image),
          ) // Réutilisation de ta factory !
          .toList(),
    );
  }
}
