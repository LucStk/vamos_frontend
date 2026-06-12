import 'package:flutter/foundation.dart';

class CollectionNode {
  final ValueNotifier<int> revision = ValueNotifier(0);

  void notify() => revision.value++;
}
