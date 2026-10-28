import 'dart:ui';
import 'package:domain_core/space/offset_type.dart';
import 'package:map_canvas/src/domain/length.dart';
import 'package:map_canvas/src/domain/paint_spec.dart';
part "draw_circle.dart";
part "draw_hatched_stroke.dart";
part "draw_path.dart";

sealed class DrawCommand {
  const DrawCommand();

  /// `true` si la commande contient au moins une dimension en px écran
  /// (donc dépendante du zoom). Abstrait : chaque commande doit se
  /// prononcer, le compilateur refuse un oubli.
  bool get dependsOnZoom;
}

final class DrawTransform extends DrawCommand {
  const DrawTransform({required this.transform, required this.commands});
  final DrawTransformData transform;
  final List<DrawCommand> commands;

  /// Une translation en px rend tout le sous-arbre dépendant du zoom.
  /// Sinon, dépendant dès qu'un enfant l'est.
  @override
  bool get dependsOnZoom =>
      transform.translation.dependsOnZoom ||
      commands.any((c) => c.dependsOnZoom);
}

final class DrawGroup extends DrawCommand {
  const DrawGroup(this.commands);
  final List<DrawCommand> commands;

  /// Un groupe mixte (enfants invariants et dépendants) renvoie `true` :
  /// il participe à la passe dépendante. Le renderer, lui, descend dans
  /// les enfants et les trie un par un.
  @override
  bool get dependsOnZoom => commands.any((c) => c.dependsOnZoom);
}

final class DrawTransformData {
  const DrawTransformData({
    this.scale = 1.0,
    this.translation = LengthOffset.zero,
    this.rotation = 0.0,
    this.origin = const WorldOffset(Offset.zero),
  });

  final double scale; // sans dimension
  final LengthOffset translation;
  final double rotation; // sans dimension
  final WorldOffset origin;
}
