import 'package:flutter/cupertino.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_application/events/ui_events.dart';
import 'package:trip_domain/domain/entities/vertex/vertex_ui_model.dart';
import 'package:trip_domain/domain/types/vertex_ref.dart';
import 'package:vamos_cartographie/features/map_ui/rendering/elements/drag_marker_ui_element.dart';
import 'package:vamos_cartographie/features/map_ui/rendering/elements/vertex/vertex_marker.dart';
import 'package:vamos_cartographie/features/topology/presentation/adapters/mobility_type_display.dart';

extension VertexUiDisplay with Marker on VertexUiModel {
  @override
  LatLng get latLng => position;

  @override
  Widget buildMarker({bool isDragging = false}) =>
      VertexMarker(vertexRef: id, isDragging: isDragging);
  @override
  MapUiEvent tapEvent() => VertexTapped(id);
  @override
  MapUiEvent doubleTapEvent() => VertexDoubleTapped(vertex.id);
  @override
  MapUiEvent dragStartEvent(_) => VertexDragStarted(vertex.id);
  @override
  MapUiEvent dragEndEvent(_) => VertexDragEndend(vertex.id);
}
