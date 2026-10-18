// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'camera_or_null.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(cameraOrNull)
final cameraOrNullProvider = CameraOrNullProvider._();

final class CameraOrNullProvider
    extends
        $FunctionalProvider<
          FlutterMapCamera?,
          FlutterMapCamera?,
          FlutterMapCamera?
        >
    with $Provider<FlutterMapCamera?> {
  CameraOrNullProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cameraOrNullProvider',
        isAutoDispose: false,
        dependencies: <ProviderOrFamily>[mapCameraProvider],
        $allTransitiveDependencies: <ProviderOrFamily>[
          CameraOrNullProvider.$allTransitiveDependencies0,
        ],
      );

  static final $allTransitiveDependencies0 = mapCameraProvider;

  @override
  String debugGetCreateSourceHash() => _$cameraOrNullHash();

  @$internal
  @override
  $ProviderElement<FlutterMapCamera?> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FlutterMapCamera? create(Ref ref) {
    return cameraOrNull(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FlutterMapCamera? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FlutterMapCamera?>(value),
    );
  }
}

String _$cameraOrNullHash() => r'7c492bc66759ee685f08a0fe38e1fae405e31402';
