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
    extends $FunctionalProvider<PencilItem?, PencilItem?, PencilItem?>
    with $Provider<PencilItem?> {
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
  $ProviderElement<PencilItem?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PencilItem? create(Ref ref) {
    final argument = this.argument as MapCameraReader;
    return pencilItem(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PencilItem? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PencilItem?>(value),
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

String _$pencilItemHash() => r'e7e38adfeca71bab5c1d14f9fd05ff09fc5490af';

final class PencilItemFamily extends $Family
    with $FunctionalFamilyOverride<PencilItem?, MapCameraReader> {
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
