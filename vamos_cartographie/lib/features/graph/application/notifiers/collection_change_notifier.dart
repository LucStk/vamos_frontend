import 'package:flutter/foundation.dart';

class CollectionSignal<T> extends ChangeNotifier {
  void notify() {
    notifyListeners();
  }
}
