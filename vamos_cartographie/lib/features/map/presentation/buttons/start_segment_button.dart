import 'package:flutter/material.dart';

class StartSegmentButton extends StatelessWidget {
  final VoidCallback onPressed;
  const StartSegmentButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        iconColor: Colors.white,
        backgroundColor: Colors.lightGreen,
      ),
      icon: const Icon(Icons.add_road, size: 30),
    );
  }
}
