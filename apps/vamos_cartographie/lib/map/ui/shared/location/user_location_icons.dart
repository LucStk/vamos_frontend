import 'package:flutter/cupertino.dart';
import 'package:material_ui/material_ui.dart';
import '/app_services/app_services.dart';

extension UserLocationStateExtension on UserLocationState {
  Color colorOf(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return switch (this) {
      UserPositionLoading() || UserPositionActive() => scheme.primary,
      UserPositionInactive() => scheme.onSurfaceVariant,
      UserPositionUnavailable() => scheme.error,
    };
  }

  Widget iconWidget(BuildContext context) {
    final color = colorOf(context);
    return switch (this) {
      UserPositionLoading() => const SizedBox(
        width: 20,
        height: 20,
        child: CupertinoActivityIndicator(),
      ),

      UserPositionActive() => Icon(Icons.location_on, color: color),

      UserPositionInactive() => Icon(Icons.location_off, color: color),

      UserPositionUnavailable() => Icon(Icons.location_disabled, color: color),
    };
  }
}
