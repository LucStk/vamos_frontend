// slot.dart
import 'base_mode_model.dart';

/// Clé typée. Se déclare en constante, comme un provider.
final class Slot<T extends Object> {
  const Slot(this.name, {this.clearWhen});
  final String name;

  /// Le slot est vidé quand cette condition est vraie lors d'une transition.
  /// `null` = il survit à tous les changements de mode.
  final bool Function(BaseMode from, BaseMode to)? clearWhen;
}

/// Quelques politiques courantes.
bool leavesType<T extends BaseMode<T>>(BaseMode from, BaseMode to) =>
    from is T && to is! T;
