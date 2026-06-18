// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vertex_handler.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(VertexHandler)
final vertexHandlerProvider = VertexHandlerFamily._();

final class VertexHandlerProvider
    extends $NotifierProvider<VertexHandler, void> {
  VertexHandlerProvider._({
    required VertexHandlerFamily super.from,
    required Id<Trip> super.argument,
  }) : super(
         retry: null,
         name: r'vertexHandlerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$vertexHandlerHash();

  @override
  String toString() {
    return r'vertexHandlerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  VertexHandler create() => VertexHandler();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is VertexHandlerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$vertexHandlerHash() => r'325d78f6d2018f85ada28d78cc2ce2f257fc4616';

final class VertexHandlerFamily extends $Family
    with $ClassFamilyOverride<VertexHandler, void, void, void, Id<Trip>> {
  VertexHandlerFamily._()
    : super(
        retry: null,
        name: r'vertexHandlerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  VertexHandlerProvider call(Id<Trip> tripId) =>
      VertexHandlerProvider._(argument: tripId, from: this);

  @override
  String toString() => r'vertexHandlerProvider';
}

abstract class _$VertexHandler extends $Notifier<void> {
  late final _$args = ref.$arg as Id<Trip>;
  Id<Trip> get tripId => _$args;

  void build(Id<Trip> tripId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
