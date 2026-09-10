import 'dart:ui';

import 'package:map_application/map_application.dart';

mixin MapHitTester {
  ProjectedScene get scene;

  MapObject? hitTest(Offset point, {MapObject? exclude}) {
    for (final candidate in scene.objects) {
      if (exclude != null && exclude.isSameAs(candidate.object)) {
        continue;
      }

      if (candidate.isHitAt(point)) {
        return candidate.object;
      }
    }

    return null;
  }
}
