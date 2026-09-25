import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/map/map.dart';
import 'package:vamos_cartographie/map/overlay_ui/widgets/map_control_button_shell.dart';

import 'package:riverpod_annotation/experimental/scope.dart';

@Dependencies([mapCamera])
class CameraButtonsControl extends ConsumerWidget {
  const CameraButtonsControl({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final camera = ref.watch(mapCameraProvider);

    return Column(
      children: [
        MapControlButton(
          icon: CupertinoIcons.add,
          tooltip: 'Zoom avant',
          onPressed: () => camera.zoomIn(),
        ),
        const SizedBox(height: 6),
        MapControlButton(
          icon: CupertinoIcons.minus,
          tooltip: 'Zoom arrière',
          onPressed: () => camera.zoomOut(),
        ),
        const SizedBox(height: 6),
        StreamBuilder<double>(
          stream: camera.rotationStream,
          initialData: camera.rotation,
          builder: (context, snapshot) {
            final rotation = snapshot.data ?? 0;
            if (rotation == 0) return const SizedBox.shrink();
            return IconButton(
              icon: Transform.rotate(
                angle: rotation * (3.14159 / 180),
                child: const Icon(CupertinoIcons.location_north_fill),
              ),
              onPressed: () => camera.rotateTo(0),
            );
          },
        ),
      ],
    );
  }
}
