import 'package:flutter/material.dart';

class EndSegmentButton extends StatelessWidget {
  final VoidCallback onPressed;
  const EndSegmentButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        iconColor: Colors.white,
        backgroundColor: Colors.lightGreen,
      ),
      icon: const Icon(Icons.stop_circle, size: 30),
    );
  }
}
