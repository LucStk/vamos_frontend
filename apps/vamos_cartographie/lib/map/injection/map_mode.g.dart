// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_mode.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// État courant du mode (lecture seule), fourni par le scope.

@ProviderFor(mapMode)
final mapModeProvider = MapModeProvider._();

/// État courant du mode (lecture seule), fourni par le scope.

final class MapModeProvider
    extends
        $FunctionalProvider<
          BaseMode<BaseMode<dynamic>>,
          BaseMode<BaseMode<dynamic>>,
          BaseMode<BaseMode<dynamic>>
        >
    with $Provider<BaseMode<BaseMode<dynamic>>> {
  /// État courant du mode (lecture seule), fourni par le scope.
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
  $ProviderElement<BaseMode<BaseMode<dynamic>>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  BaseMode<BaseMode<dynamic>> create(Ref ref) {
    return mapMode(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BaseMode<BaseMode<dynamic>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BaseMode<BaseMode<dynamic>>>(value),
    );
  }
}

String _$mapModeHash() => r'ca3e096948e878af80084bd932d7d4dc36bd6aa5';

/// Contrôleur du mode actif (reçoit les gestes), fourni par le scope.

@ProviderFor(mapModeController)
final mapModeControllerProvider = MapModeControllerProvider._();

/// Contrôleur du mode actif (reçoit les gestes), fourni par le scope.

final class MapModeControllerProvider
    extends $FunctionalProvider<GestureSink, GestureSink, GestureSink>
    with $Provider<GestureSink> {
  /// Contrôleur du mode actif (reçoit les gestes), fourni par le scope.
  MapModeControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mapModeControllerProvider',
        isAutoDispose: false,
        dependencies: <ProviderOrFamily>[],
        $allTransitiveDependencies: <ProviderOrFamily>[],
      );

  @override
  String debugGetCreateSourceHash() => _$mapModeControllerHash();

  @$internal
  @override
  $ProviderElement<GestureSink> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GestureSink create(Ref ref) {
    return mapModeController(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GestureSink value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GestureSink>(value),
    );
  }
}

String _$mapModeControllerHash() => r'4ea27d260a739e29367ad9cf3814574ce04366cd';
