import 'package:domain_core/domain_core.dart';
import 'package:riverpod/riverpod.dart';

void addListenerRebuild(Ref ref, Observable obs) {
  void listener() => ref.invalidateSelf();
  obs.addListener(listener);
  ref.onDispose(() => obs.removeListener(listener));
}
