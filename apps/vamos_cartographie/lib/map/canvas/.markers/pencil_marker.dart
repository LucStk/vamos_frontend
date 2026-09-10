import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PencilMarker extends ConsumerWidget {
  const PencilMarker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Icon(Icons.draw_sharp, size: 30, color: Colors.black);
  }
}
