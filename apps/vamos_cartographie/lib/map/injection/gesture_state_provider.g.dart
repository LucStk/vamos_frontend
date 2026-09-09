// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gesture_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GestureStateNotifier)
final gestureStateProvider = GestureStateNotifierFamily._();

final class GestureStateNotifierProvider
    extends $NotifierProvider<GestureStateNotifier, GestureState> {
  GestureStateNotifierProvider._({
    required GestureStateNotifierFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'gestureStateProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$gestureStateNotifierHash();

  @override
  String toString() {
    return r'gestureStateProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  GestureStateNotifier create() => GestureStateNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GestureState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GestureState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GestureStateNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$gestureStateNotifierHash() =>
    r'54015241f801b386751ee026674d77b384c5e98d';

final class GestureStateNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          GestureStateNotifier,
          GestureState,
          GestureState,
          GestureState,
          TripId
        > {
  GestureStateNotifierFamily._()
    : super(
        retry: null,
        name: r'gestureStateProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  GestureStateNotifierProvider call(TripId tripId) =>
      GestureStateNotifierProvider._(argument: tripId, from: this);

  @override
  String toString() => r'gestureStateProvider';
}

abstract class _$GestureStateNotifier extends $Notifier<GestureState> {
  late final _$args = ref.$arg as TripId;
  TripId get tripId => _$args;

  GestureState build(TripId tripId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<GestureState, GestureState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<GestureState, GestureState>,
              GestureState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}

@ProviderFor(isDragInProgress)
final isDragInProgressProvider = IsDragInProgressFamily._();

final class IsDragInProgressProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  IsDragInProgressProvider._({
    required IsDragInProgressFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'isDragInProgressProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$isDragInProgressHash();

  @override
  String toString() {
    return r'isDragInProgressProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    final argument = this.argument as TripId;
    return isDragInProgress(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is IsDragInProgressProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$isDragInProgressHash() => r'e7c12c389aacdbd45e9a0ff030a51fd0ef5bb801';

final class IsDragInProgressFamily extends $Family
    with $FunctionalFamilyOverride<bool, TripId> {
  IsDragInProgressFamily._()
    : super(
        retry: null,
        name: r'isDragInProgressProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  IsDragInProgressProvider call(TripId tripId) =>
      IsDragInProgressProvider._(argument: tripId, from: this);

  @override
  String toString() => r'isDragInProgressProvider';
}

@ProviderFor(CameraRevision)
final cameraRevisionProvider = CameraRevisionFamily._();

final class CameraRevisionProvider
    extends $NotifierProvider<CameraRevision, int> {
  CameraRevisionProvider._({
    required CameraRevisionFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'cameraRevisionProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$cameraRevisionHash();

  @override
  String toString() {
    return r'cameraRevisionProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  CameraRevision create() => CameraRevision();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CameraRevisionProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$cameraRevisionHash() => r'e2ce064bc78dc6c1e30cf4c77623720b7f535682';

final class CameraRevisionFamily extends $Family
    with $ClassFamilyOverride<CameraRevision, int, int, int, TripId> {
  CameraRevisionFamily._()
    : super(
        retry: null,
        name: r'cameraRevisionProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  CameraRevisionProvider call(TripId tripId) =>
      CameraRevisionProvider._(argument: tripId, from: this);

  @override
  String toString() => r'cameraRevisionProvider';
}

abstract class _$CameraRevision extends $Notifier<int> {
  late final _$args = ref.$arg as TripId;
  TripId get tripId => _$args;

  int build(TripId tripId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}

@ProviderFor(pencilScreenPosition)
final pencilScreenPositionProvider = PencilScreenPositionFamily._();

final class PencilScreenPositionProvider
    extends $FunctionalProvider<Point<double>?, Point<double>?, Point<double>?>
    with $Provider<Point<double>?> {
  PencilScreenPositionProvider._({
    required PencilScreenPositionFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'pencilScreenPositionProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$pencilScreenPositionHash();

  @override
  String toString() {
    return r'pencilScreenPositionProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<Point<double>?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Point<double>? create(Ref ref) {
    final argument = this.argument as TripId;
    return pencilScreenPosition(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Point<double>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Point<double>?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PencilScreenPositionProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$pencilScreenPositionHash() =>
    r'68b832b4949ade52ac4e8f16efb22f2bc00c21d0';

final class PencilScreenPositionFamily extends $Family
    with $FunctionalFamilyOverride<Point<double>?, TripId> {
  PencilScreenPositionFamily._()
    : super(
        retry: null,
        name: r'pencilScreenPositionProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PencilScreenPositionProvider call(TripId tripId) =>
      PencilScreenPositionProvider._(argument: tripId, from: this);

  @override
  String toString() => r'pencilScreenPositionProvider';
}
