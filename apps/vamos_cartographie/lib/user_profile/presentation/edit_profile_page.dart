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

  @override
  void initState() {
    super.initState();

    final profile = ref.read(meProvider).value?.profile;

    _profileNameController = TextEditingController(
      text: profile?.profileName ?? '',
    );

    _bioController = TextEditingController(text: profile?.bio ?? '');
  }

  @override
  void dispose() {
    _profileNameController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    FocusScope.of(context).unfocus();

    // À remplacer par ton MeNotifier.
    //
    // final result = await ref
    //     .read(meProvider.notifier)
    //     .updateProfile(
    //       profileName: _profileNameController.text.trim(),
    //       bio: _bioController.text.trim(),
    //     );

    if (!mounted) {
      return;
    }

    Navigator.of(context).pop();
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

            const SizedBox(height: 32),

            TextFormField(
              controller: _profileNameController,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: 'Nom d’utilisateur',
                hintText: 'Votre nom d’utilisateur',
              ),
              validator: (value) {
                final username = value?.trim() ?? '';

                if (username.isEmpty) {
                  return 'Veuillez saisir un nom d’utilisateur';
                }

                return null;
              },
            ),

            const SizedBox(height: 16),

            TextFormField(
              controller: _bioController,
              maxLines: 5,
              maxLength: 500,
              decoration: const InputDecoration(
                labelText: 'Biographie',
                hintText: 'Présentez-vous...',
                alignLabelWithHint: true,
              ),
            ),

            const SizedBox(height: 24),

            FilledButton(onPressed: _save, child: const Text('Enregistrer')),
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
              // TODO: sélection et upload de la photo.
            },
            icon: const Icon(Icons.camera_alt_outlined),
          ),
        ),
      ],
    );
  }
}
