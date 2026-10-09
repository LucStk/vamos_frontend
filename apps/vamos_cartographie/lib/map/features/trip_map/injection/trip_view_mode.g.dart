// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_view_mode.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TripViewer)
final tripViewerProvider = TripViewerFamily._();

final class TripViewerProvider
    extends $NotifierProvider<TripViewer, ModeState<ViewTripMode>> {
  TripViewerProvider._({
    required TripViewerFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'tripViewerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  static final $allTransitiveDependencies0 = mapCameraProvider;

  @override
  String debugGetCreateSourceHash() => _$tripViewerHash();

  @override
  String toString() {
    return r'tripViewerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  TripViewer create() => TripViewer();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ModeState<ViewTripMode> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ModeState<ViewTripMode>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TripViewerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$tripViewerHash() => r'fc9270efaf90696d992a53014edb13ed60451124';

final class TripViewerFamily extends $Family
    with
        $ClassFamilyOverride<
          TripViewer,
          ModeState<ViewTripMode>,
          ModeState<ViewTripMode>,
          ModeState<ViewTripMode>,
          TripId
        > {
  TripViewerFamily._()
    : super(
        retry: null,
        name: r'tripViewerProvider',
        dependencies: <ProviderOrFamily>[mapCameraProvider],
        $allTransitiveDependencies: <ProviderOrFamily>[
          TripViewerProvider.$allTransitiveDependencies0,
        ],
        isAutoDispose: true,
      );

  TripViewerProvider call(TripId tripId) =>
      TripViewerProvider._(argument: tripId, from: this);

  @override
  String toString() => r'tripViewerProvider';
}

abstract class _$TripViewer extends $Notifier<ModeState<ViewTripMode>> {
  late final _$args = ref.$arg as TripId;
  TripId get tripId => _$args;

  ModeState<ViewTripMode> build(TripId tripId);
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<ModeState<ViewTripMode>, ModeState<ViewTripMode>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ModeState<ViewTripMode>, ModeState<ViewTripMode>>,
              ModeState<ViewTripMode>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(_$args));
  }
}
