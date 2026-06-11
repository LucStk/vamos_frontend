class Node<T> {
  T? value;
  bool deleted = false;
  int revision = 0;

  Node(this.value);
}
