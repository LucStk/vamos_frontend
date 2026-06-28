enum MediaOwnerType { waypoint, trip }

mixin MediaOwner {
  MediaOwnerType get mediaOwnerType;
}

// class Trip with MediaOwner {
//   @override
//   MediaOwnerType get mediaOwnerType => MediaOwnerType.trip;
// }

// class Waypoint with MediaOwner {
//   @override
//   MediaOwnerType get mediaOwnerType => MediaOwnerType.waypoint;
// }
