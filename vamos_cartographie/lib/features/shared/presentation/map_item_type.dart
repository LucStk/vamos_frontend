import 'package:flutter/material.dart';

// map_item_type.dart — pas de Flutter
abstract interface class MapItemType {
  String get label;
  IconData get icon;
  int get colorValue; // int hex, pas Color
}
