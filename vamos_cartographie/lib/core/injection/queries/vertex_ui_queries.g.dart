// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vertex_ui_queries.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(verticesUi)
final verticesUiProvider = VerticesUiFamily._();

final class VerticesUiProvider
    extends
        $FunctionalProvider<
          Map<Id<dynamic>, VertexUiModel>,
          Map<Id<dynamic>, VertexUiModel>,
          Map<Id<dynamic>, VertexUiModel>
        >
    with $Provider<Map<Id<dynamic>, VertexUiModel>> {
  VerticesUiProvider._({
    required VerticesUiFamily super.from,
    required (TripId, SegmentId) super.argument,
  }) : super(
         retry: null,
         name: r'verticesUiProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$verticesUiHash();

  @override
  String toString() {
    return r'verticesUiProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<Map<Id<dynamic>, VertexUiModel>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  Map<Id<dynamic>, VertexUiModel> create(Ref ref) {
    final argument = this.argument as (TripId, SegmentId);
    return verticesUi(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<Id<dynamic>, VertexUiModel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<Id<dynamic>, VertexUiModel>>(
        value,
      ),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is VerticesUiProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$verticesUiHash() => r'074f3985e41932e808e9e3b796943af7364f38c4';

final class VerticesUiFamily extends $Family
    with
        $FunctionalFamilyOverride<
          Map<Id<dynamic>, VertexUiModel>,
          (TripId, SegmentId)
        > {
  VerticesUiFamily._()
    : super(
        retry: null,
        name: r'verticesUiProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  VerticesUiProvider call(TripId tripId, SegmentId segId) =>
      VerticesUiProvider._(argument: (tripId, segId), from: this);

  @override
  String toString() => r'verticesUiProvider';
}
