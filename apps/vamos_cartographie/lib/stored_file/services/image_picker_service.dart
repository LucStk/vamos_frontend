import 'dart:io';
import 'package:file_selector/file_selector.dart';
import 'package:image_picker/image_picker.dart';

Future<List<File>> pickImages() async {
  List<File> picked = [];
  // Peut picker plusieurs Images !
  if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
    const typeGroup = XTypeGroup(
      label: 'Images',
      extensions: ['jpg', 'jpeg', 'png', 'gif', 'webp'],
    );
    final files = await openFiles(acceptedTypeGroups: [typeGroup]);
    picked = files.map((f) => File(f.path)).toList();
  } else {
    final picker = ImagePicker();
    final images = await picker.pickMultiImage();
    picked = images.map((x) => File(x.path)).toList();
  }
  return picked;
}

Future<File?> pickImage() async {
  if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
    const typeGroup = XTypeGroup(
      label: 'Images',
      extensions: ['jpg', 'jpeg', 'png', 'gif', 'webp'],
    );
    final file = await openFile(acceptedTypeGroups: [typeGroup]);
    if (file == null) return null;
    return File(file.path);
  } else {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return null;
    return File(image.path);
  }
}
