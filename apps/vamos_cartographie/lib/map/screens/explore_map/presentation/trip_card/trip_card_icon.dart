import 'package:flutter/material.dart';

class TripCardIcon extends StatelessWidget {
  const TripCardIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // TODO: implement build
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(Icons.route, color: theme.colorScheme.onPrimaryContainer),
    );
  }
}
