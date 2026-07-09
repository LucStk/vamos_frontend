// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vertex_queries.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(vertexRefs)
final vertexRefsProvider = VertexRefsProvider._();

final class VertexRefsProvider
    extends
        $FunctionalProvider<List<VertexRef>, List<VertexRef>, List<VertexRef>>
    with $Provider<List<VertexRef>> {
  VertexRefsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'vertexRefsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$vertexRefsHash();

  @$internal
  @override
  $ProviderElement<List<VertexRef>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<VertexRef> create(Ref ref) {
    return vertexRefs(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<VertexRef> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<VertexRef>>(value),
    );
  }
}

String _$vertexRefsHash() => r'fa3d295c0747af9cd14dd37bd742b9c17de1cd1d';

@ProviderFor(vertexUiElement)
final vertexUiElementProvider = VertexUiElementFamily._();

final class VertexUiElementProvider
    extends $FunctionalProvider<VertexElement, VertexElement, VertexElement>
    with $Provider<VertexElement> {
  VertexUiElementProvider._({
    required VertexUiElementFamily super.from,
    required (TripId, VertexRef) super.argument,
  }) : super(
         retry: null,
         name: r'vertexUiElementProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$vertexUiElementHash();

  @override
  String toString() {
    return r'vertexUiElementProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<VertexElement> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  VertexElement create(Ref ref) {
    final argument = this.argument as (TripId, VertexRef);
    return vertexUiElement(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(VertexElement value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<VertexElement>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is VertexUiElementProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$vertexUiElementHash() => r'd611ff82402f8a79770d5c6436a2c8995578237f';

final class VertexUiElementFamily extends $Family
    with $FunctionalFamilyOverride<VertexElement, (TripId, VertexRef)> {
  VertexUiElementFamily._()
    : super(
        retry: null,
        name: r'vertexUiElementProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  VertexUiElementProvider call(TripId tripId, VertexRef vertexRef) =>
      VertexUiElementProvider._(argument: (tripId, vertexRef), from: this);

  @override
  String toString() => r'vertexUiElementProvider';
}

@ProviderFor(isVertexSelected)
final isVertexSelectedProvider = IsVertexSelectedFamily._();

final class IsVertexSelectedProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  IsVertexSelectedProvider._({
    required IsVertexSelectedFamily super.from,
    required (TripId, VertexRef) super.argument,
  }) : super(
         retry: null,
         name: r'isVertexSelectedProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$isVertexSelectedHash();

  @override
  String toString() {
    return r'isVertexSelectedProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    final argument = this.argument as (TripId, VertexRef);
    return isVertexSelected(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is IsVertexSelectedProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$isVertexSelectedHash() => r'cf6fda209e717ae768ca43e4337475918246a3ac';

final class IsVertexSelectedFamily extends $Family
    with $FunctionalFamilyOverride<bool, (TripId, VertexRef)> {
  IsVertexSelectedFamily._()
    : super(
        retry: null,
        name: r'isVertexSelectedProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  IsVertexSelectedProvider call(TripId tripId, VertexRef vertexRef) =>
      IsVertexSelectedProvider._(argument: (tripId, vertexRef), from: this);

  @override
  String toString() => r'isVertexSelectedProvider';
}
