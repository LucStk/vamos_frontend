import 'package:material_ui/material_ui.dart';
import 'package:vamos_cartographie/routing/routes/auth_routes.dart';

/// Propose de se connecter ou de créer un compte, pour une action qui en
/// demande un.
///
/// Préférable à un bouton absent : le visiteur voit ce qu'il peut faire, et
/// apprend ici ce qui lui manque, au lieu de tomber sur un bouton mort.
///
/// [action] complète la phrase, à l'infinitif : « mettre ce voyage en
/// favori ».
Future<void> showSignInRequiredDialog(
  BuildContext context, {
  required String action,
}) => showDialog<void>(
  context: context,
  builder: (dialogContext) => AlertDialog(
    title: const Text('Un compte est nécessaire'),
    content: Text('Connectez-vous ou créez un compte pour $action.'),
    actions: [
      TextButton(
        onPressed: () => Navigator.of(dialogContext).pop(),
        child: const Text('Plus tard'),
      ),
      TextButton(
        onPressed: () {
          Navigator.of(dialogContext).pop();
          const RegisterRoute().push(context);
        },
        child: const Text('Créer un compte'),
      ),
      FilledButton(
        onPressed: () {
          Navigator.of(dialogContext).pop();
          const LoginRoute().push(context);
        },
        child: const Text('Se connecter'),
      ),
    ],
  ),
);
