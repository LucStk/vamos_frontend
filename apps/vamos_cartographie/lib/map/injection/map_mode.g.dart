// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_mode.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MapMode)
final mapModeProvider = MapModeProvider._();

final class MapModeProvider
    extends $NotifierProvider<MapMode, BaseMode<BaseMode<dynamic>>> {
  MapModeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mapModeProvider',
        isAutoDispose: false,
        dependencies: <ProviderOrFamily>[],
        $allTransitiveDependencies: <ProviderOrFamily>[],
      );

  @override
  String debugGetCreateSourceHash() => _$mapModeHash();

  @$internal
  @override
  MapMode create() => MapMode();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BaseMode<BaseMode<dynamic>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BaseMode<BaseMode<dynamic>>>(value),
    );
  }
}

String _$mapModeHash() => r'729003ef7805e04992ae5b8bc461b497483cb2cd';

abstract class _$MapMode extends $Notifier<BaseMode<BaseMode<dynamic>>> {
  BaseMode<BaseMode<dynamic>> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref
            as $Ref<BaseMode<BaseMode<dynamic>>, BaseMode<BaseMode<dynamic>>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                BaseMode<BaseMode<dynamic>>,
                BaseMode<BaseMode<dynamic>>
              >,
              BaseMode<BaseMode<dynamic>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
