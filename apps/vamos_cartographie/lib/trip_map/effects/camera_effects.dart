part of 'map_effects.dart';

class ZoomToEffect extends MapEffect {
  const ZoomToEffect({required this.offset});

  final Offset offset;

  @override
  Future<TripMapState?> resolver(MapEffectContext context) async {
    final latLng = context.camera.screenOffsetToLatLng(offset);
    context.camera.zoomTo(latLng);
    return null;
  }
}
