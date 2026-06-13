/*
group('WaypointsNotifier avec Fake Client', () {
  late ProviderContainer container;

  setUp(() {
    container = buildContainer(exploreSeed);
  });

  tearDown(() {
    container.dispose();
  });

  // ── chargement initial ─────────────────────────────────────────────────

  test(
    'chargement initial : tous les waypoints du trip t1 sont présents',
    () async {
      // Given: store seedé avec t1 (4 waypoints)
      // When: WaypointsNotifier(t1.id) s'initialise
      // Then: les 4 waypoints sont dans l'état
      container.listen(waypointsProvider(t1TripId), (_, _) {});

      final waypoints = await container.read(
        waypointsProvider(t1TripId).future,
      );

      expect(waypoints, hasLength(t1Waypoints.length));
      expect(waypoints.containsKey(10), isTrue);
    },
  );

  test('trip sans waypoints : état initial est une Map vide', () async {
    // Given: un trip sans waypoints dans le store
    // When: WaypointsNotifier s'initialise sur ce trip
    // Then: état est vide
    final seed = emptyWaypointSeed(tripId: 99);
    final emptyContainer = buildContainer([seed]);
    addTearDown(emptyContainer.dispose);
    emptyContainer.listen(waypointsProvider(99), (_, _) {});

    final waypoints = await emptyContainer.read(waypointsProvider(99).future);

    expect(waypoints, isEmpty);
  });

  // Note : le test "trip inconnu → AsyncError" est intentionnellement
  // absent ici. En Riverpod 3, un AsyncNotifier qui échoue lors du
  // premier chargement passe en AsyncLoading(retrying) plutôt que
  // AsyncError. Ce comportement est couvert par le test repository
  // "retourne ServerFailure pour un trip inconnu".

  // ── createWaypoint ──────────────────────────────────────────────────────

  test("createWaypoint : le nouveau waypoint apparaît dans l'état", () async {
    // Given: waypoints de t1 chargés
    // When: createWaypoint est appelé avec vertexId=13
    // Then: l'état contient le nouveau waypoint
    container.listen(waypointsProvider(t1TripId), (_, _) {});
    await container.read(waypointsProvider(t1TripId).future);

    final draft = WaypointDraft(
      type: WaypointType.camping,
      title: 'Camp de nuit',
      description: 'Au bord de la rivière',
    );
    await container
        .read(waypointsProvider(t1TripId).notifier)
        .createWaypoint(draft, unusedVertexId, null);

    final waypoints = container
        .read(waypointsProvider(t1TripId))
        .requireValue;
    expect(waypoints.length, t1Waypoints.length + 1);

    final nouveau = waypoints.values.firstWhere(
      (w) => w.title == 'Camp de nuit',
    );
    expect(nouveau.type, WaypointType.camping);
    expect(nouveau.description, 'Au bord de la rivière');
    expect(nouveau.vertexId, unusedVertexId);
  });

  // ── updateWaypoint ──────────────────────────────────────────────────────

  test("updateWaypoint : l'état reflète les données mises à jour", () async {
    // Given: waypoints de t1 chargés
    // When: updateWaypoint est appelé sur id=10
    // Then: l'état contient le waypoint mis à jour
    container.listen(waypointsProvider(t1TripId), (_, _) {});
    await container.read(waypointsProvider(t1TripId).future);

    final draft = WaypointDraft(
      type: WaypointType.viewpoint,
      title: 'Belvédère',
      description: 'Vue panoramique',
    );
    await container
        .read(waypointsProvider(t1TripId).notifier)
        .updateWaypoint(10, draft);

    final waypoints = container
        .read(waypointsProvider(t1TripId))
        .requireValue;
    expect(waypoints[10]?.type, WaypointType.viewpoint);
    expect(waypoints[10]?.title, 'Belvédère');
  });

  test(
    "updateWaypoint rollback : l'état revient à la valeur originale si le serveur échoue",
    () async {
      // Given: waypoints de t1 chargés
      //   Et: waypoint id=10 supprimé du store (simule une panne serveur)
      // When: updateWaypoint est appelé sur id=10
      // Then: l'état est restauré avec le type original du waypoint
      final backend = buildFakeBackend(exploreSeed);
      final rollbackContainer = buildContainer([], backend: backend);
      addTearDown(rollbackContainer.dispose);
      rollbackContainer.listen(waypointsProvider(t1TripId), (_, _) {});
      await rollbackContainer.read(waypointsProvider(t1TripId).future);

      final originalType = rollbackContainer
          .read(waypointsProvider(t1TripId))
          .requireValue[10]!
          .type;

      // Supprime le waypoint du store sous-jacent
      backend.store.removeWaypoint(10);

      final draft = WaypointDraft(
        type: WaypointType.historic,
        title: 'Titre non sauvegardé',
      );
      await rollbackContainer
          .read(waypointsProvider(t1TripId).notifier)
          .updateWaypoint(10, draft);

      final waypoints = rollbackContainer
          .read(waypointsProvider(t1TripId))
          .requireValue;
      expect(waypoints[10]?.type, originalType);
    },
  );

  // ── deleteWaypoint ──────────────────────────────────────────────────────

  test("deleteWaypoint : le waypoint disparaît de l'état", () async {
    // Given: waypoints de t1 chargés
    // When: deleteWaypoint(10) est appelé
    // Then: waypoint 10 n'est plus dans l'état, les autres sont présents
    container.listen(waypointsProvider(t1TripId), (_, _) {});
    await container.read(waypointsProvider(t1TripId).future);

    await container
        .read(waypointsProvider(t1TripId).notifier)
        .deleteWaypoint(10);

    final waypoints = container
        .read(waypointsProvider(t1TripId))
        .requireValue;
    expect(waypoints.containsKey(10), isFalse);
    expect(waypoints.containsKey(11), isTrue);
    expect(waypoints.containsKey(12), isTrue);
  });
}); */
