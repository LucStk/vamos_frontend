// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'span_bound_handle_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Surlignage des portions déplacées et curseurs des deux bornes.
///
/// Pas `keepAlive` : ce provider ne vit que pendant le mode. Avec
/// `keepAlive`, chaque instance de [EditSpanMode] (clé de famille comparée
/// par identité) laisserait une entrée en cache jamais libérée.

@ProviderFor(spanBoundHandleItems)
final spanBoundHandleItemsProvider = SpanBoundHandleItemsFamily._();

/// Surlignage des portions déplacées et curseurs des deux bornes.
///
/// Pas `keepAlive` : ce provider ne vit que pendant le mode. Avec
/// `keepAlive`, chaque instance de [EditSpanMode] (clé de famille comparée
/// par identité) laisserait une entrée en cache jamais libérée.

final class SpanBoundHandleItemsProvider
    extends
        $FunctionalProvider<List<SceneItem>, List<SceneItem>, List<SceneItem>>
    with $Provider<List<SceneItem>> {
  /// Surlignage des portions déplacées et curseurs des deux bornes.
  ///
  /// Pas `keepAlive` : ce provider ne vit que pendant le mode. Avec
  /// `keepAlive`, chaque instance de [EditSpanMode] (clé de famille comparée
  /// par identité) laisserait une entrée en cache jamais libérée.
  SpanBoundHandleItemsProvider._({
    required SpanBoundHandleItemsFamily super.from,
    required (EditSpanMode, MapCameraReader) super.argument,
  }) : super(
         retry: null,
         name: r'spanBoundHandleItemsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  static final $allTransitiveDependencies0 = modeSlotProvider;
  static final $allTransitiveDependencies1 =
      ModeSlotProvider.$allTransitiveDependencies0;

  @override
  String debugGetCreateSourceHash() => _$spanBoundHandleItemsHash();

  @override
  String toString() {
    return r'spanBoundHandleItemsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<List<SceneItem>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<SceneItem> create(Ref ref) {
    final argument = this.argument as (EditSpanMode, MapCameraReader);
    return spanBoundHandleItems(ref, argument.$1, argument.$2);
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
    return other is SpanBoundHandleItemsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$spanBoundHandleItemsHash() =>
    r'b05199ce340195a322a5307fa5ed63e960f7b7fd';

/// Surlignage des portions déplacées et curseurs des deux bornes.
///
/// Pas `keepAlive` : ce provider ne vit que pendant le mode. Avec
/// `keepAlive`, chaque instance de [EditSpanMode] (clé de famille comparée
/// par identité) laisserait une entrée en cache jamais libérée.

final class SpanBoundHandleItemsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          List<SceneItem>,
          (EditSpanMode, MapCameraReader)
        > {
  SpanBoundHandleItemsFamily._()
    : super(
        retry: null,
        name: r'spanBoundHandleItemsProvider',
        dependencies: <ProviderOrFamily>[modeSlotProvider],
        $allTransitiveDependencies: <ProviderOrFamily>[
          SpanBoundHandleItemsProvider.$allTransitiveDependencies0,
          SpanBoundHandleItemsProvider.$allTransitiveDependencies1,
        ],
        isAutoDispose: true,
      );

  /// Surlignage des portions déplacées et curseurs des deux bornes.
  ///
  /// Pas `keepAlive` : ce provider ne vit que pendant le mode. Avec
  /// `keepAlive`, chaque instance de [EditSpanMode] (clé de famille comparée
  /// par identité) laisserait une entrée en cache jamais libérée.

  SpanBoundHandleItemsProvider call(
    EditSpanMode mode,
    MapCameraReader camera,
  ) => SpanBoundHandleItemsProvider._(argument: (mode, camera), from: this);

  @override
  String toString() => r'spanBoundHandleItemsProvider';
}
