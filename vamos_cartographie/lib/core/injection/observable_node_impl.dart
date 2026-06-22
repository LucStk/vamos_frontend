import 'package:domain_core/observable_node.dart';

class ObservableNodeImpl extends ObservableNode {
  final List<void Function()> _listeners = [];

  @override
  void addListener(void Function() listener) => _listeners.add(listener);

  @override
  void removeListener(void Function() listener) => _listeners.remove(listener);

  @override
  void notify() {
    for (final l in List.of(_listeners)) l();
  }
}
