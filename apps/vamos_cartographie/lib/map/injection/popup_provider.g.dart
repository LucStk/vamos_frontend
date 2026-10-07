// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popup_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PopUpNotifier)
final popUpProvider = PopUpNotifierProvider._();

final class PopUpNotifierProvider
    extends $NotifierProvider<PopUpNotifier, ScreenOffset?> {
  PopUpNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'popUpProvider',
        isAutoDispose: false,
        dependencies: <ProviderOrFamily>[mapModeControllerProvider],
        $allTransitiveDependencies: <ProviderOrFamily>[
          PopUpNotifierProvider.$allTransitiveDependencies0,
        ],
      );

  static final $allTransitiveDependencies0 = mapModeControllerProvider;

  @override
  String debugGetCreateSourceHash() => _$popUpNotifierHash();

  @$internal
  @override
  PopUpNotifier create() => PopUpNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ScreenOffset? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ScreenOffset?>(value),
    );
  }
}

String _$popUpNotifierHash() => r'3ff8c8b8c4d3efbb5bcf735656c6f1c27055bb82';

abstract class _$PopUpNotifier extends $Notifier<ScreenOffset?> {
  ScreenOffset? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<ScreenOffset?, ScreenOffset?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ScreenOffset?, ScreenOffset?>,
              ScreenOffset?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
