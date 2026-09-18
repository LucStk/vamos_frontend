@Riverpod(keepAlive: true)
ProjectedScene projectedDataScene(Ref ref, TripId tripId) {
  final sketchSegment = ref.watch(projectSketchSegmentProvider(tripId));
  final sketchPencil = ref.watch(projectSketchPencilProvider(tripId));
  final userLocation = ref.watch(projectUserLocationProvider);

  final objects = <ProjectedObject>[
    if (sketchSegment case final segment?) segment,
    if (sketchPencil case final pencil?) pencil,
    if (userLocation case final location?) location,
  ];
  objects.sort((a, b) => b.object.hitPriority.compareTo(a.object.hitPriority));
  return ProjectedScene(objects);
}
