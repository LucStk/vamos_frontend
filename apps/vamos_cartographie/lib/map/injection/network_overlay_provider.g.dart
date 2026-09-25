// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'network_overlay_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ActiveNetworkOverlays)
final activeNetworkOverlaysProvider = ActiveNetworkOverlaysProvider._();

final class ActiveNetworkOverlaysProvider
    extends $NotifierProvider<ActiveNetworkOverlays, Set<NetworkOverlayType>> {
  ActiveNetworkOverlaysProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeNetworkOverlaysProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeNetworkOverlaysHash();

  @$internal
  @override
  ActiveNetworkOverlays create() => ActiveNetworkOverlays();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<NetworkOverlayType> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<NetworkOverlayType>>(value),
    );
  }
}

String _$activeNetworkOverlaysHash() =>
    r'30e25cfb81466edd1862b620adb540342d377801';

abstract class _$ActiveNetworkOverlays
    extends $Notifier<Set<NetworkOverlayType>> {
  Set<NetworkOverlayType> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<Set<NetworkOverlayType>, Set<NetworkOverlayType>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Set<NetworkOverlayType>, Set<NetworkOverlayType>>,
              Set<NetworkOverlayType>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
