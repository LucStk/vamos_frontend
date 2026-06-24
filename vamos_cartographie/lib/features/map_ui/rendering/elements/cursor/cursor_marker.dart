import 'package:flutter/material.dart';

class CursorMarker extends StatelessWidget {
  final bool isDragging;
  const CursorMarker({super.key, this.isDragging = false});

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.place_sharp, size: 30, color: Colors.black);
  }
}
