import 'dart:io';
import 'dart:typed_data';

import 'package:material_ui/material_ui.dart';
import 'package:path/path.dart' as p;
import 'package:pro_image_editor/pro_image_editor.dart';

/// Ouvre l'éditeur (recadrer, tourner, retourner…) sur une image et rend le
/// fichier retouché, ou `null` si l'utilisateur est sorti sans valider.
///
/// Une seule des deux sources : [file] pour une image sur l'appareil, [url]
/// pour une image déjà envoyée. Partagé par les photos du profil, du voyage et
/// des étapes.
Future<File?> editImage(BuildContext context, {File? file, String? url}) async {
  assert((file == null) != (url == null), 'file ou url, pas les deux');

  final bytes = await Navigator.of(context).push<Uint8List>(
    MaterialPageRoute(
      builder: (editorContext) {
        final callbacks = ProImageEditorCallbacks(
          onImageEditingComplete: (bytes) async =>
              Navigator.of(editorContext).pop(bytes),
        );
        return file != null
            ? ProImageEditor.file(file, callbacks: callbacks)
            : ProImageEditor.network(url!, callbacks: callbacks);
      },
    ),
  );
  if (bytes == null) return null;

  // L'éditeur rend du JPEG : le fichier en porte l'extension, le serveur s'en
  // sert pour le type MIME.
  final dir = await Directory.systemTemp.createTemp('vamos_edit_');
  final name = file == null ? 'photo' : p.basenameWithoutExtension(file.path);
  return File(p.join(dir.path, '$name.jpg')).writeAsBytes(bytes);
}
