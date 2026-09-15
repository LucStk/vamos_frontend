import 'package:domain_core/failures/failures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stored_file_application/application/upload_service.dart';
import 'package:vamos_cartographie/stored_file/services/services.dart';
import 'package:vamos_cartographie/stored_file/stored_file.dart';
import 'dart:io';

import 'package:flutter/material.dart';

class ProfilePictureEditor extends StatelessWidget {
  const ProfilePictureEditor({
    super.key,
    required this.imageUrl,
    required this.previewFile,
    required this.isLoading,
    this.errorMessage,
    required this.onPickImage,
  });

  final String? imageUrl;
  final File? previewFile;

  /// Indique qu'une opération concernant la photo est en cours.
  final bool isLoading;

  final String? errorMessage;

  final VoidCallback onPickImage;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    ImageProvider? imageProvider;

    if (previewFile != null) {
      imageProvider = FileImage(previewFile!);
    } else if (imageUrl != null) {
      imageProvider = NetworkImage(imageUrl!);
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: imageProvider,
              child: imageProvider == null
                  ? const Icon(Icons.person_outline, size: 60)
                  : null,
            ),

            if (isLoading)
              Positioned.fill(
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black38,
                  ),
                  child: const Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  ),
                ),
              ),

            Positioned(
              right: 0,
              bottom: 0,
              child: IconButton.filled(
                tooltip: 'Modifier la photo',
                onPressed: isLoading ? null : onPickImage,
                icon: const Icon(Icons.camera_alt_outlined),
              ),
            ),
          ],
        ),

        if (errorMessage != null) ...[
          const SizedBox(height: 8),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 280),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.error_outline,
                  size: 16,
                  color: theme.colorScheme.error,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    errorMessage!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: theme.colorScheme.error,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
