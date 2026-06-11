import "tx.dart";

class Node<T> {
  T? value;

  bool deleted = false;
  int revision = 0;

  final List<Tx<T>> txStack = [];

  Node(this.value);
}
