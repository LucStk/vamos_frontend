import 'package:flutter/material.dart';

class ThumbnailDeleteButton extends StatelessWidget {
  const ThumbnailDeleteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 4,
      right: 4,
      child: Container(
        width: 22,
        height: 22,
        decoration: const BoxDecoration(
          color: Colors.black54,
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.close, color: Colors.white, size: 14),
      ),
    );
  }
}
