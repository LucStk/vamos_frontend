// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selection_handle_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(selectionHandleItems)
final selectionHandleItemsProvider = SelectionHandleItemsFamily._();

final class SelectionHandleItemsProvider
    extends
        $FunctionalProvider<List<SceneItem>, List<SceneItem>, List<SceneItem>>
    with $Provider<List<SceneItem>> {
  SelectionHandleItemsProvider._({
    required SelectionHandleItemsFamily super.from,
    required (TripId, MapCameraReader) super.argument,
  }) : super(
         retry: null,
         name: r'selectionHandleItemsProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  static final $allTransitiveDependencies0 = modeSlotProvider;
  static final $allTransitiveDependencies1 =
      ModeSlotProvider.$allTransitiveDependencies0;

  @override
  String debugGetCreateSourceHash() => _$selectionHandleItemsHash();

  @override
  String toString() {
    return r'selectionHandleItemsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<List<SceneItem>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<SceneItem> create(Ref ref) {
    final argument = this.argument as (TripId, MapCameraReader);
    return selectionHandleItems(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<SceneItem> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<SceneItem>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SelectionHandleItemsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$selectionHandleItemsHash() =>
    r'f72b2f233a8c75526c6d3f80e9005e397d10c485';

final class SelectionHandleItemsFamily extends $Family
    with $FunctionalFamilyOverride<List<SceneItem>, (TripId, MapCameraReader)> {
  SelectionHandleItemsFamily._()
    : super(
        retry: null,
        name: r'selectionHandleItemsProvider',
        dependencies: <ProviderOrFamily>[modeSlotProvider],
        $allTransitiveDependencies: <ProviderOrFamily>[
          SelectionHandleItemsProvider.$allTransitiveDependencies0,
          SelectionHandleItemsProvider.$allTransitiveDependencies1,
        ],
        isAutoDispose: false,
      );

  SelectionHandleItemsProvider call(TripId tripId, MapCameraReader camera) =>
      SelectionHandleItemsProvider._(argument: (tripId, camera), from: this);

  @override
  String toString() => r'selectionHandleItemsProvider';
}
