import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vamos_cartographie/user_location/user_location.dart';

extension UserLocationStateExtension on UserLocationState {
  Color get color => switch (this) {
    UserPositionLoading() => CupertinoColors.activeBlue,
    UserPositionActive() => CupertinoColors.activeBlue,
    UserPositionInactive() => CupertinoColors.inactiveGray,
    UserPositionUnavailable() => CupertinoColors.systemRed,
  };

  Widget get iconWidget => switch (this) {
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
