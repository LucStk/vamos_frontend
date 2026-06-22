abstract class ObservableNode {
  void addListener(void Function() listener);
  void removeListener(void Function() listener);
  void notify();
}
