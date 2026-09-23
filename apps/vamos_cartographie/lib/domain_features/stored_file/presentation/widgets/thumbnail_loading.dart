import 'package:flutter/material.dart';

class ThumbnailLoading extends StatelessWidget {
  const ThumbnailLoading({super.key});
  @override
  Widget build(BuildContext context) {
    return const ColoredBox(
      color: Colors.black45,
      child: Center(
        child: SizedBox(
          width: 28,
          height: 28,
          child: CircularProgressIndicator(
            strokeWidth: 2.5,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
