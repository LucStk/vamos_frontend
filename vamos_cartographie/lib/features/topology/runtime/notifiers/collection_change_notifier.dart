import 'package:flutter/foundation.dart';

/// Signal that notifies listeners when a collection changes
class CollectionSignal<T> extends ChangeNotifier {
  void notify() {
    notifyListeners();
  }
}
