import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stored_file_application/stored_file_application.dart';
import 'package:vamos_cartographie/domain_features/stored_file/stored_file.dart';
import 'package:vamos_cartographie/domain_features/user_profile/providers/user_session_providers.dart';

class EditProfilePage extends ConsumerStatefulWidget {
  const EditProfilePage({super.key});

  @override
  ConsumerState<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends ConsumerState<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _profileNameController;
  late final TextEditingController _bioController;

  File? _selectedProfilePicture;

  bool _isSaving = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();

    final profile = ref.read(meProvider).value?.profile;

    _profileNameController = TextEditingController(
      text: profile?.profileName ?? '',
    );

    _bioController = TextEditingController(text: profile?.bio ?? '');

    _bioController.addListener(_clearErrorOnType);
  }

  void _clearErrorOnType() {
    if (_errorMessage != null) {
      setState(() {
        _errorMessage = null;
      });
    }
  }

  @override
  void dispose() {
    _bioController.removeListener(_clearErrorOnType);
    _profileNameController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  Future<void> _pickProfilePicture() async {
    final file = await pickImage();

    if (file == null || !mounted) {
      return;
    }

    setState(() {
      _selectedProfilePicture = file;
      _errorMessage = null;
    });
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    FocusScope.of(context).unfocus();

    setState(() {
      _isSaving = true;
      _errorMessage = null;
    });

    StoredFileId? profilePictureId;

    /*
     * 1. Upload de la nouvelle photo si l'utilisateur en a sélectionné une.
     */
    if (_selectedProfilePicture != null) {
      final uploadResult = await ref
          .read(uploadServiceProvider)
          .upload(_selectedProfilePicture!);

      if (!mounted) {
        return;
      }

      final uploadFailure = uploadResult.fold((failure) => failure, (fileId) {
        profilePictureId = fileId;
        return null;
      });

      if (uploadFailure != null) {
        setState(() {
          _isSaving = false;
          _errorMessage = uploadFailure.message;
        });

        return;
      }
    }

    /*
     * 2. Mise à jour du profil.
     *
     * MeNotifier met ensuite à jour meProvider avec le nouveau Me.
     */
    final failure = await ref
        .read(meProvider.notifier)
        .updateProfile(
          bio: _bioController.text.trim(),
          fileId: profilePictureId,
        );

    if (!mounted) {
      return;
    }

    if (failure != null) {
      setState(() {
        _isSaving = false;
        _errorMessage = failure.message;
      });

      return;
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final profile = ref.watch(meProvider).value?.profile;

    return Scaffold(
      appBar: AppBar(title: const Text('Modifier mon profil')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            Center(
              child: ProfilePictureEditor(
                imageUrl: profile?.profilePictureUrl,
                previewFile: _selectedProfilePicture,
                isLoading: _isSaving,
                errorMessage: _errorMessage,
                onPickImage: _pickProfilePicture,
              ),
            ),

            const SizedBox(height: 32),

            TextFormField(
              controller: _profileNameController,
              enabled: !_isSaving,
              decoration: const InputDecoration(labelText: 'Nom du profil'),
            ),

            const SizedBox(height: 16),

            TextFormField(
              controller: _bioController,
              maxLines: 5,
              maxLength: 500,
              enabled: !_isSaving,
              decoration: const InputDecoration(
                labelText: 'Biographie',
                hintText: 'Présentez-vous...',
                alignLabelWithHint: true,
              ),
            ),

            if (_errorMessage != null) ...[
              const SizedBox(height: 8),
              _ErrorMessage(message: _errorMessage!),
            ],

            const SizedBox(height: 24),

            FilledButton(
              onPressed: _isSaving ? null : _save,
              child: _isSaving
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Text('Enregistrer'),
            ),
          ],
        ),
      ),
    );
  }
}

class _ErrorMessage extends StatelessWidget {
  const _ErrorMessage({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.error;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.error_outline, size: 16, color: color),
        const SizedBox(width: 8),
        Expanded(
          child: Text(message, style: TextStyle(color: color, fontSize: 13)),
        ),
      ],
    );
  }
}
