import 'package:flutter/material.dart';

// map_item_style.dart — pas de Flutter
abstract interface class MapItemStyle {
  String get label;
  IconData get icon;
  int get colorValue; // int hex, pas Color
}
