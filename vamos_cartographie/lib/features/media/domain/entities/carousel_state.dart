import 'carousel_item.dart';
// import 'package:vamos_cartographie/features/media/domain/entities/entities.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'carousel_state.freezed.dart';

@freezed
abstract class CarouselState with _$CarouselState {
  const factory CarouselState({@Default([]) List<CarouselItem> items}) =
      _CarouselState;

  const CarouselState._(); // Nécessaire pour les méthodes et getters

  // Ta factory de conversion reste très propre
  factory CarouselState.fromRemote(List<MediaImage> remoteImages) {
    return CarouselState(
      items: remoteImages
          .map((img) => CarouselItem.remote(image: img))
          .toList(),
    );
  }

  // Ton getter pour extraire uniquement les images distantes
  List<MediaImage> get remoteImages => items
      .where((item) => item.isRemote)
      .map((item) => item.remoteImage!)
      .toList();
}
