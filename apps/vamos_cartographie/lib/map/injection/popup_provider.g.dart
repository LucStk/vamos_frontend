// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popup_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Position écran du popup, recalculée à chaque mouvement de la carte.

@ProviderFor(popupWorldPosition)
final popupWorldPositionProvider = PopupWorldPositionProvider._();

/// Position écran du popup, recalculée à chaque mouvement de la carte.

final class PopupWorldPositionProvider
    extends $FunctionalProvider<WorldOffset?, WorldOffset?, WorldOffset?>
    with $Provider<WorldOffset?> {
  /// Position écran du popup, recalculée à chaque mouvement de la carte.
  PopupWorldPositionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'popupWorldPositionProvider',
        isAutoDispose: false,
        dependencies: <ProviderOrFamily>[mapCameraProvider, mapModeProvider],
        $allTransitiveDependencies: <ProviderOrFamily>[
          PopupWorldPositionProvider.$allTransitiveDependencies0,
          PopupWorldPositionProvider.$allTransitiveDependencies1,
        ],
      );

  static final $allTransitiveDependencies0 = mapCameraProvider;
  static final $allTransitiveDependencies1 = mapModeProvider;

  @override
  String debugGetCreateSourceHash() => _$popupWorldPositionHash();

  @$internal
  @override
  $ProviderElement<WorldOffset?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  WorldOffset? create(Ref ref) {
    return popupWorldPosition(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WorldOffset? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WorldOffset?>(value),
    );
  }
}

String _$popupWorldPositionHash() =>
    r'75efb0f8f709f6a3c7c229c61a49dac4a6d5f93c';

@ProviderFor(popupScreenPosition)
final popupScreenPositionProvider = PopupScreenPositionProvider._();

final class PopupScreenPositionProvider
    extends $FunctionalProvider<ScreenOffset?, ScreenOffset?, ScreenOffset?>
    with $Provider<ScreenOffset?> {
  PopupScreenPositionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'popupScreenPositionProvider',
        isAutoDispose: false,
        dependencies: <ProviderOrFamily>[
          mapCameraSnapshotProvider,
          popupWorldPositionProvider,
        ],
        $allTransitiveDependencies: <ProviderOrFamily>{
          PopupScreenPositionProvider.$allTransitiveDependencies0,
          PopupScreenPositionProvider.$allTransitiveDependencies1,
          PopupScreenPositionProvider.$allTransitiveDependencies2,
          PopupScreenPositionProvider.$allTransitiveDependencies3,
        },
      );

  static final $allTransitiveDependencies0 = mapCameraSnapshotProvider;
  static final $allTransitiveDependencies1 =
      MapCameraSnapshotProvider.$allTransitiveDependencies0;
  static final $allTransitiveDependencies2 = popupWorldPositionProvider;
  static final $allTransitiveDependencies3 =
      PopupWorldPositionProvider.$allTransitiveDependencies1;

  @override
  String debugGetCreateSourceHash() => _$popupScreenPositionHash();

  @$internal
  @override
  $ProviderElement<ScreenOffset?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ScreenOffset? create(Ref ref) {
    return popupScreenPosition(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ScreenOffset? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ScreenOffset?>(value),
    );
  }
}

String _$popupScreenPositionHash() =>
    r'ebbe6ef8f3fcfe344ced1bb21ea88e6baeb50d11';
