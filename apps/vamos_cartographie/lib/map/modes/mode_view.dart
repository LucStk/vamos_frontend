// map/modes/mode_view.dart
import 'package:flutter/cupertino.dart';
import 'package:vamos_cartographie/map/scene/scene_spec.dart';

final class ModeView {
  const ModeView({required this.scene, required this.ui});
  final SceneSpec scene;
  final Widget Function() ui; // construit seulement par ModeUi
}
