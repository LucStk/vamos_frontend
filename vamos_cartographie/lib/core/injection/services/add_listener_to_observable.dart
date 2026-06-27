import 'package:domain_core/domain_core.dart';
import 'package:riverpod/riverpod.dart';

void addListenerRebuild(Ref ref, Observable obs) {
  // ref.notifyListeners() bypasse le check d'égalité (contrairement à
  // invalidateSelf) et force la notification des widgets watchers même
  // lorsque le provider retourne le même objet mutable.
  void listener() => ref.notifyListeners();
  obs.addListener(listener);
  ref.onDispose(() => obs.removeListener(listener));
}
