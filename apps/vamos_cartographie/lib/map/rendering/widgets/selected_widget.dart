import 'package:flutter/material.dart';

class SelectedWidget extends StatelessWidget {
  final Widget child;
  final bool isSelected;
  const SelectedWidget({
    super.key,
    required this.child,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: isSelected ? 1.5 : 1.0,
      duration: const Duration(milliseconds: 150),
      curve: Curves.easeOutBack,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: isSelected ? 2 : 0),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.35),
                    blurRadius: 2,
                    spreadRadius: 1,
                  ),
                ]
              : [],
        ),
        child: child,
      ),
    );
  }
}
