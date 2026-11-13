// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_store.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(routeRemoteDatasource)
final routeRemoteDatasourceProvider = RouteRemoteDatasourceProvider._();

final class RouteRemoteDatasourceProvider
    extends
        $FunctionalProvider<
          RouteRemoteDatasource,
          RouteRemoteDatasource,
          RouteRemoteDatasource
        >
    with $Provider<RouteRemoteDatasource> {
  RouteRemoteDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'routeRemoteDatasourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$routeRemoteDatasourceHash();

  @$internal
  @override
  $ProviderElement<RouteRemoteDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RouteRemoteDatasource create(Ref ref) {
    return routeRemoteDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RouteRemoteDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RouteRemoteDatasource>(value),
    );
  }
}

String _$routeRemoteDatasourceHash() =>
    r'3aef357828deb71387bedc6520b3f7e487c6f10e';

@ProviderFor(routeRepository)
final routeRepositoryProvider = RouteRepositoryProvider._();

final class RouteRepositoryProvider
    extends
        $FunctionalProvider<RouteRepository, RouteRepository, RouteRepository>
    with $Provider<RouteRepository> {
  RouteRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'routeRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$routeRepositoryHash();

  @$internal
  @override
  $ProviderElement<RouteRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RouteRepository create(Ref ref) {
    return routeRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RouteRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RouteRepository>(value),
    );
  }
}

String _$routeRepositoryHash() => r'2e2e5cc0958211c545a711b6f2554f68a4e4e11d';

/// La route d'un trip et tous ses calques, dans un seul état : les
/// `startIndex` des calques ne sont cohérents qu'avec la géométrie de la même
/// version (voir `RouteStore`).

@ProviderFor(RouteStoreNotifier)
final routeStoreProvider = RouteStoreNotifierFamily._();

/// La route d'un trip et tous ses calques, dans un seul état : les
/// `startIndex` des calques ne sont cohérents qu'avec la géométrie de la même
/// version (voir `RouteStore`).
final class RouteStoreNotifierProvider
    extends $NotifierProvider<RouteStoreNotifier, RouteStore> {
  /// La route d'un trip et tous ses calques, dans un seul état : les
  /// `startIndex` des calques ne sont cohérents qu'avec la géométrie de la même
  /// version (voir `RouteStore`).
  RouteStoreNotifierProvider._({
    required RouteStoreNotifierFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'routeStoreProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$routeStoreNotifierHash();

  @override
  String toString() {
    return r'routeStoreProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  RouteStoreNotifier create() => RouteStoreNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RouteStore value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RouteStore>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is RouteStoreNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$routeStoreNotifierHash() =>
    r'dfb16afbd15aeb5aada574b911db004651f16578';

/// La route d'un trip et tous ses calques, dans un seul état : les
/// `startIndex` des calques ne sont cohérents qu'avec la géométrie de la même
/// version (voir `RouteStore`).

final class RouteStoreNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          RouteStoreNotifier,
          RouteStore,
          RouteStore,
          RouteStore,
          TripId
        > {
  RouteStoreNotifierFamily._()
    : super(
        retry: null,
        name: r'routeStoreProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  /// La route d'un trip et tous ses calques, dans un seul état : les
  /// `startIndex` des calques ne sont cohérents qu'avec la géométrie de la même
  /// version (voir `RouteStore`).

  RouteStoreNotifierProvider call(TripId tripId) =>
      RouteStoreNotifierProvider._(argument: tripId, from: this);

  @override
  String toString() => r'routeStoreProvider';
}

/// La route d'un trip et tous ses calques, dans un seul état : les
/// `startIndex` des calques ne sont cohérents qu'avec la géométrie de la même
/// version (voir `RouteStore`).

abstract class _$RouteStoreNotifier extends $Notifier<RouteStore> {
  late final _$args = ref.$arg as TripId;
  TripId get tripId => _$args;

  RouteStore build(TripId tripId);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<RouteStore, RouteStore>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<RouteStore, RouteStore>,
              RouteStore,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}

/// Vertex de début et de fin de chaque span du calque modalité.

@ProviderFor(mobilitySpanRanges)
final mobilitySpanRangesProvider = MobilitySpanRangesFamily._();

/// Vertex de début et de fin de chaque span du calque modalité.

final class MobilitySpanRangesProvider
    extends
        $FunctionalProvider<
          Map<SpanId, VertexRange>,
          Map<SpanId, VertexRange>,
          Map<SpanId, VertexRange>
        >
    with $Provider<Map<SpanId, VertexRange>> {
  /// Vertex de début et de fin de chaque span du calque modalité.
  MobilitySpanRangesProvider._({
    required MobilitySpanRangesFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'mobilitySpanRangesProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$mobilitySpanRangesHash();

  @override
  String toString() {
    return r'mobilitySpanRangesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<Map<SpanId, VertexRange>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  Map<SpanId, VertexRange> create(Ref ref) {
    final argument = this.argument as TripId;
    return mobilitySpanRanges(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<SpanId, VertexRange> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<SpanId, VertexRange>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is MobilitySpanRangesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$mobilitySpanRangesHash() =>
    r'a994451320909e334e7805bcb6b15e1161ff1138';

/// Vertex de début et de fin de chaque span du calque modalité.

final class MobilitySpanRangesFamily extends $Family
    with $FunctionalFamilyOverride<Map<SpanId, VertexRange>, TripId> {
  MobilitySpanRangesFamily._()
    : super(
        retry: null,
        name: r'mobilitySpanRangesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  /// Vertex de début et de fin de chaque span du calque modalité.

  MobilitySpanRangesProvider call(TripId tripId) =>
      MobilitySpanRangesProvider._(argument: tripId, from: this);

  @override
  String toString() => r'mobilitySpanRangesProvider';
}

/// Étendue de chaque span du calque modalité.

@ProviderFor(mobilitySpanExtents)
final mobilitySpanExtentsProvider = MobilitySpanExtentsFamily._();

/// Étendue de chaque span du calque modalité.

final class MobilitySpanExtentsProvider
    extends
        $FunctionalProvider<
          Map<SpanId, SpanExtent>,
          Map<SpanId, SpanExtent>,
          Map<SpanId, SpanExtent>
        >
    with $Provider<Map<SpanId, SpanExtent>> {
  /// Étendue de chaque span du calque modalité.
  MobilitySpanExtentsProvider._({
    required MobilitySpanExtentsFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'mobilitySpanExtentsProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$mobilitySpanExtentsHash();

  @override
  String toString() {
    return r'mobilitySpanExtentsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<Map<SpanId, SpanExtent>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  Map<SpanId, SpanExtent> create(Ref ref) {
    final argument = this.argument as TripId;
    return mobilitySpanExtents(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<SpanId, SpanExtent> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<SpanId, SpanExtent>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is MobilitySpanExtentsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$mobilitySpanExtentsHash() =>
    r'5d0ef082bd4a89ede374af7e187ce5544f0b3fbb';

/// Étendue de chaque span du calque modalité.

final class MobilitySpanExtentsFamily extends $Family
    with $FunctionalFamilyOverride<Map<SpanId, SpanExtent>, TripId> {
  MobilitySpanExtentsFamily._()
    : super(
        retry: null,
        name: r'mobilitySpanExtentsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  /// Étendue de chaque span du calque modalité.

  MobilitySpanExtentsProvider call(TripId tripId) =>
      MobilitySpanExtentsProvider._(argument: tripId, from: this);

  @override
  String toString() => r'mobilitySpanExtentsProvider';
}

/// Vertex de début et de fin de chaque span du calque d'édition.

@ProviderFor(editSpanRanges)
final editSpanRangesProvider = EditSpanRangesFamily._();

/// Vertex de début et de fin de chaque span du calque d'édition.

final class EditSpanRangesProvider
    extends
        $FunctionalProvider<
          Map<SpanId, VertexRange>,
          Map<SpanId, VertexRange>,
          Map<SpanId, VertexRange>
        >
    with $Provider<Map<SpanId, VertexRange>> {
  /// Vertex de début et de fin de chaque span du calque d'édition.
  EditSpanRangesProvider._({
    required EditSpanRangesFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'editSpanRangesProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$editSpanRangesHash();

  @override
  String toString() {
    return r'editSpanRangesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<Map<SpanId, VertexRange>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  Map<SpanId, VertexRange> create(Ref ref) {
    final argument = this.argument as TripId;
    return editSpanRanges(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<SpanId, VertexRange> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<SpanId, VertexRange>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is EditSpanRangesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$editSpanRangesHash() => r'0f6a002915ed7bd640f707b5a527484836add64c';

/// Vertex de début et de fin de chaque span du calque d'édition.

final class EditSpanRangesFamily extends $Family
    with $FunctionalFamilyOverride<Map<SpanId, VertexRange>, TripId> {
  EditSpanRangesFamily._()
    : super(
        retry: null,
        name: r'editSpanRangesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  /// Vertex de début et de fin de chaque span du calque d'édition.

  EditSpanRangesProvider call(TripId tripId) =>
      EditSpanRangesProvider._(argument: tripId, from: this);

  @override
  String toString() => r'editSpanRangesProvider';
}
