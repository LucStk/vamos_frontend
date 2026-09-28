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
        isAutoDispose: true,
        dependencies: <ProviderOrFamily>[mapCameraProvider],
        $allTransitiveDependencies: <ProviderOrFamily>[
          PopupWorldPositionProvider.$allTransitiveDependencies0,
        ],
      );

  static final $allTransitiveDependencies0 = mapCameraProvider;

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
    r'9f3ce11494e31e3ccd031272f5fd3514554f1567';

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
        isAutoDispose: true,
        dependencies: <ProviderOrFamily>[mapCameraSnapshotProvider],
        $allTransitiveDependencies: <ProviderOrFamily>[
          PopupScreenPositionProvider.$allTransitiveDependencies0,
          PopupScreenPositionProvider.$allTransitiveDependencies1,
        ],
      );

  static final $allTransitiveDependencies0 = mapCameraSnapshotProvider;
  static final $allTransitiveDependencies1 =
      MapCameraSnapshotProvider.$allTransitiveDependencies0;

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
    r'3c01ea8c8e45085e976dea70bd826a7fb1e553f4';
