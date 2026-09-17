import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_canvas/camera_transform_widget.dart';

class TestLayer extends StatelessWidget {
  const TestLayer({super.key});

  @override
  Widget build(BuildContext context) {
    final camera = MapCamera.of(context);

    return CameraTransform(
      camera: camera,
      child: CustomPaint(size: camera.size, painter: TestPainter()),
    );
  }
}

class TestPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.red;

    canvas.drawCircle(const Offset(100, 100), 3, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
