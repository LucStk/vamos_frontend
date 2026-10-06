import 'package:map_engine/application/application.dart';

final class GestureResult<M extends BaseMode<M>> {
  const GestureResult({this.mode, this.command});

  /// Aucun changement, aucune commande.
  const GestureResult.none() : this();

  /// Transition de mode seule.
  const GestureResult.to(M mode) : this(mode: mode);

  /// Commande seule, le mode ne change pas.
  const GestureResult.run(ModeCommand<M> command) : this(command: command);

  final M? mode;
  final ModeCommand<M>? command;
}
