// mode_machine/mode_command.dart

import '../../map_engine.dart';

/// Une intention d'effet. `R` est la donnée qu'elle produit (`Done` si aucune).
abstract class ModeCommand<M extends BaseMode<M>, R extends Object> {
  const ModeCommand();
}

/// Exécute les effets de bord d'une commande.
/// Retourne `null` si l'effet a échoué ou n'a rien produit : le `then` du
/// GestureResult n'est alors pas appelé.
abstract class ModeCommandResolver<M extends BaseMode<M>> {
  const ModeCommandResolver();

  Future<R?> resolve<R extends Object>(ModeCommand<M, R> command);
}
