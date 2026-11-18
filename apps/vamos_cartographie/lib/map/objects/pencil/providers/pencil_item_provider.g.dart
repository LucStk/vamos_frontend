// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pencil_item_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(pencilItem)
final pencilItemProvider = PencilItemFamily._();

final class PencilItemProvider
    extends $FunctionalProvider<SceneItem?, SceneItem?, SceneItem?>
    with $Provider<SceneItem?> {
  PencilItemProvider._({
    required PencilItemFamily super.from,
    required MapCameraReader super.argument,
  }) : super(
         retry: null,
         name: r'pencilItemProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$pencilItemHash();

  @override
  String toString() {
    return r'pencilItemProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<SceneItem?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SceneItem? create(Ref ref) {
    final argument = this.argument as MapCameraReader;
    return pencilItem(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SceneItem? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SceneItem?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PencilItemProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$pencilItemHash() => r'3088082825dfe012841e43efad8ee071052cbde8';

final class PencilItemFamily extends $Family
    with $FunctionalFamilyOverride<SceneItem?, MapCameraReader> {
  PencilItemFamily._()
    : super(
        retry: null,
        name: r'pencilItemProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  PencilItemProvider call(MapCameraReader camera) =>
      PencilItemProvider._(argument: camera, from: this);

  @override
  String toString() => r'pencilItemProvider';
}
