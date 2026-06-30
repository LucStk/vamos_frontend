class IdGenerator {
  static int _currentId = -1;
  static int next() => _currentId--;
}
