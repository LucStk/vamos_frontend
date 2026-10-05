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
    r'fcca65be0fdf6fd48ea8ac8fb1234a5a07751beb';
