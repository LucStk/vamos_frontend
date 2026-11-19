import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Donne aux pages l'accès au dépliage de la sheet, pour qu'elles placent
/// elles-mêmes leur bouton (voir [SheetExpandButton]).
class PagedSheetScope extends InheritedWidget {
  const PagedSheetScope({
    super.key,
    required this.toggle,
    required this.isAtMin,
    required super.child,
  });

  final VoidCallback toggle;
  final ValueListenable<bool> isAtMin;

  static PagedSheetScope? maybeOf(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<PagedSheetScope>();

  @override
  bool updateShouldNotify(PagedSheetScope old) =>
      toggle != old.toggle || isAtMin != old.isAtMin;
}
