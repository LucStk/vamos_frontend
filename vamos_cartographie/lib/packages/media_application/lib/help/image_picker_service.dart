import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_selector/file_selector.dart';
import 'package:image_picker/image_picker.dart';

Future<List<String>> pickImages(BuildContext context, WidgetRef ref) async {
  List<String> picked = [];
  // Peut picker plusieurs Images !
  if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
    const typeGroup = XTypeGroup(
      label: 'Images',
      extensions: ['jpg', 'jpeg', 'png', 'gif', 'webp'],
    );
    final files = await openFiles(acceptedTypeGroups: [typeGroup]);
    picked = files.map((f) => f.path).toList();
  } else {
    final picker = ImagePicker();
    final images = await picker.pickMultiImage();
    picked = images.map((x) => x.path).toList();
  }
  return picked;
}
