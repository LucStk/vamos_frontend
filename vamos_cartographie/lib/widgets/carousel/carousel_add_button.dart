import 'package:flutter/material.dart';

// ─────────────────────────────────────────────────────────────────────────────
// Bouton "+"
// ─────────────────────────────────────────────────────────────────────────────

class AddButton extends StatelessWidget {
  final double size;
  final VoidCallback onTap;

  const AddButton({required this.size, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: size,
        height: size,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.grey.shade400,
              width: 1.5,
              style: BorderStyle.solid,
            ),
            color: Colors.grey.shade50,
          ),
          child: Icon(
            Icons.add_photo_alternate_outlined,
            size: size * 0.4,
            color: Colors.grey.shade500,
          ),
        ),
      ),
    );
  }
}
