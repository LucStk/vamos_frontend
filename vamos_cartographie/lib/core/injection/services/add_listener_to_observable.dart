import 'package:domain_core/domain_core.dart';
import 'package:riverpod/riverpod.dart';

void addListenerRebuild(Ref ref, Observable obs) {
  void listener() => ref.notifyListeners();
  bool added = false;

  Future(() {
    obs.addListener(listener);
    added = true;
  });

  ref.onDispose(() {
    if (added) obs.removeListener(listener);
  });
}
