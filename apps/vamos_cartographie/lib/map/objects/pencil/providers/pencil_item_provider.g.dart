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

  static final $allTransitiveDependencies0 = modeSlotProvider;
  static final $allTransitiveDependencies1 =
      ModeSlotProvider.$allTransitiveDependencies0;

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

String _$pencilItemHash() => r'e8f26433ca73706c316a25ada6de9fff8881c09e';

final class PencilItemFamily extends $Family
    with $FunctionalFamilyOverride<SceneItem?, MapCameraReader> {
  PencilItemFamily._()
    : super(
        retry: null,
        name: r'pencilItemProvider',
        dependencies: <ProviderOrFamily>[modeSlotProvider],
        $allTransitiveDependencies: <ProviderOrFamily>[
          PencilItemProvider.$allTransitiveDependencies0,
          PencilItemProvider.$allTransitiveDependencies1,
        ],
        isAutoDispose: false,
      );

  PencilItemProvider call(MapCameraReader camera) =>
      PencilItemProvider._(argument: camera, from: this);

  @override
  String toString() => r'pencilItemProvider';
}
