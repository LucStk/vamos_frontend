import 'package:flutter/cupertino.dart';

class EditBottomActions extends StatelessWidget {
  const EditBottomActions({
    super.key,
    required this.children,
    this.bottomOffset = 120,
    this.spacing = 8,
    this.direction = Axis.vertical,
  });

  final List<Widget> children;

  /// Distance entre le bas de l'écran et le groupe de boutons.
  final double bottomOffset;

  /// Espace entre les boutons.
  final double spacing;

  /// Vertical = empilés, horizontal = côte à côte.
  final Axis direction;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: bottomOffset),
        child: Flex(
          direction: direction,
          mainAxisSize: MainAxisSize.min,
          spacing: spacing, // Flutter >= 3.27
          children: children,
        ),
      ),
    );
  }
}
