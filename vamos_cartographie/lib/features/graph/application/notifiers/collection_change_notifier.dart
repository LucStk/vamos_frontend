import 'package:flutter/foundation.dart';

class CollectionSignal<T> extends ChangeNotifier {
  void notify() {
    debugPrint("Collection sigal receved $T");
    notifyListeners();
  }
}
