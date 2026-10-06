import 'package:map_engine/map_engine.dart';

typedef MapPointerData = ({WorldOffset offset, double scale});

enum PointerEventType { down, move, up, tapTimeout }
