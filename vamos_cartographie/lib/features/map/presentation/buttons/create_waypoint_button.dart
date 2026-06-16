import 'package:flutter/material.dart';

class CreateWaypointButton extends StatelessWidget {
  final VoidCallback onPressed;
  const CreateWaypointButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        iconColor: Colors.white,
        backgroundColor: Colors.lightGreen,
      ),
      icon: const Icon(Icons.add_location, size: 30),
    );
  }
}
