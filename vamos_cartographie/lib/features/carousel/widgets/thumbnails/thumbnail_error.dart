import 'package:flutter/material.dart';

class ThumbnailError extends StatelessWidget {
  final VoidCallback? onTap;

  const ThumbnailError({super.key, this.onTap});
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.black54,
      child: Center(
        child: GestureDetector(
          onTap: onTap,
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.refresh, color: Colors.white, size: 22),
              SizedBox(height: 2),
              Text(
                'Réessayer',
                style: TextStyle(color: Colors.white, fontSize: 9),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
