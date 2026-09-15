import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/user_profile/providers/user_session_providers.dart';

class EditProfilePage extends ConsumerStatefulWidget {
  const EditProfilePage({super.key});

  @override
  ConsumerState<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends ConsumerState<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _profileNameController;
  late final TextEditingController _bioController;

  bool _isLoading = false;
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

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    FocusScope.of(context).unfocus();

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    final failure = await ref
        .read(meProvider.notifier)
        .updateProfile(bio: _bioController.text.trim());

    if (!mounted) {
      return;
    }

    if (failure != null) {
      setState(() {
        _isLoading = false;
        _errorMessage = failure.message;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Modifier mon profil')),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            Center(
              child: _ProfilePictureEditor(
                imageUrl: ref
                    .watch(meProvider)
                    .value
                    ?.profile
                    ?.profilePictureUrl,
              ),
            ),

            const SizedBox(height: 16),

            TextFormField(
              controller: _bioController,
              maxLines: 5,
              maxLength: 500,
              enabled: !_isLoading,
              decoration: const InputDecoration(
                labelText: 'Biographie',
                hintText: 'Présentez-vous...',
                alignLabelWithHint: true,
              ),
            ),

            if (_errorMessage != null) ...[
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: 16,
                      color: Theme.of(context).colorScheme.error,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        _errorMessage!,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],

            const SizedBox(height: 24),

            FilledButton(
              onPressed: _isLoading ? null : _save,
              child: _isLoading
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

class _ProfilePictureEditor extends StatelessWidget {
  const _ProfilePictureEditor({required this.imageUrl});

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 60,
          backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : null,
          child: imageUrl == null
              ? const Icon(Icons.person_outline, size: 60)
              : null,
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: IconButton.filled(
            tooltip: 'Modifier la photo',
            onPressed: () {
              // TODO: sélection et upload de la photo avec fileId.
            },
            icon: const Icon(Icons.camera_alt_outlined),
          ),
        ),
      ],
    );
  }
}
