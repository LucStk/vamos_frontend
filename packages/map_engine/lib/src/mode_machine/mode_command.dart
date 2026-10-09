// mode_machine/mode_command.dart

import 'mode.dart';

/// Une intention d'effet. `R` est la donnée qu'elle produit (`Done` si aucune).
abstract class ModeCommand<M extends Mode<M>, R extends Object> {
  const ModeCommand();
}

/// Exécute les effets de bord d'une commande.
/// Retourne `null` si l'effet a échoué ou n'a rien produit : le `then` du
/// Transition n'est alors pas appelé.
abstract class ModeCommandResolver<M extends Mode<M>> {
  const ModeCommandResolver();

  Future<R?> resolve<R extends Object>(ModeCommand<M, R> command);
}
