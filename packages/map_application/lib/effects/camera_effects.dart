part of "map_effects.dart";

class ZoomOnPoint extends MapEffect {
  final LatLng latLng;
  final double deltaZoom;

  ZoomOnPoint(this.latLng, {this.deltaZoom = 1});

  @override
  Future<void> run(MapContext editor) async {
    editor.camera.zoomTo(latLng, deltaZoom: deltaZoom);
  }
}
