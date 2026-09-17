part of 'map_effects.dart';

class ZoomToEffect extends MapEffectImpl {
  const ZoomToEffect({required this.offset});

  final WorldOffset offset;

  @override
  Future<TripMapState?> resolve(MapEffectContext context) async {
    final latLng = context.camera.worldOffsetToLatLng(offset);
    context.camera.zoomTo(latLng);
    return null;
  }
}
