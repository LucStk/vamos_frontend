// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topology_ui_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(topologyVertices)
final topologyVerticesProvider = TopologyVerticesFamily._();

final class TopologyVerticesProvider
    extends
        $FunctionalProvider<
          List<VertexUiElement>,
          List<VertexUiElement>,
          List<VertexUiElement>
        >
    with $Provider<List<VertexUiElement>> {
  TopologyVerticesProvider._({
    required TopologyVerticesFamily super.from,
    required Id<Trip> super.argument,
  }) : super(
         retry: null,
         name: r'topologyVerticesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$topologyVerticesHash();

  @override
  String toString() {
    return r'topologyVerticesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<List<VertexUiElement>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<VertexUiElement> create(Ref ref) {
    final argument = this.argument as Id<Trip>;
    return topologyVertices(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<VertexUiElement> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<VertexUiElement>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TopologyVerticesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$topologyVerticesHash() => r'af22837f8741f59551ac380210e610f775fdc700';

final class TopologyVerticesFamily extends $Family
    with $FunctionalFamilyOverride<List<VertexUiElement>, Id<Trip>> {
  TopologyVerticesFamily._()
    : super(
        retry: null,
        name: r'topologyVerticesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TopologyVerticesProvider call(Id<Trip> tripId) =>
      TopologyVerticesProvider._(argument: tripId, from: this);

  @override
  String toString() => r'topologyVerticesProvider';
}
