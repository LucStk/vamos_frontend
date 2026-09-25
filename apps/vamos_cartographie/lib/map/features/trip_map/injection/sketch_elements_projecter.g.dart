// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sketch_elements_projecter.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(sketchElementProjection)
final sketchElementProjectionProvider = SketchElementProjectionFamily._();

final class SketchElementProjectionProvider
    extends
        $FunctionalProvider<
          List<ProjectedObject>,
          List<ProjectedObject>,
          List<ProjectedObject>
        >
    with $Provider<List<ProjectedObject>> {
  SketchElementProjectionProvider._({
    required SketchElementProjectionFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'sketchElementProjectionProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  static final $allTransitiveDependencies0 = mapCameraProvider;
  static final $allTransitiveDependencies1 = mapEditorProvider;

  @override
  String debugGetCreateSourceHash() => _$sketchElementProjectionHash();

  @override
  String toString() {
    return r'sketchElementProjectionProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<List<ProjectedObject>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<ProjectedObject> create(Ref ref) {
    final argument = this.argument as TripId;
    return sketchElementProjection(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<ProjectedObject> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<ProjectedObject>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SketchElementProjectionProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$sketchElementProjectionHash() =>
    r'8b27a120ec2a08a402105ee9155a0f5c99d93e16';

final class SketchElementProjectionFamily extends $Family
    with $FunctionalFamilyOverride<List<ProjectedObject>, TripId> {
  SketchElementProjectionFamily._()
    : super(
        retry: null,
        name: r'sketchElementProjectionProvider',
        dependencies: <ProviderOrFamily>[mapCameraProvider, mapEditorProvider],
        $allTransitiveDependencies: <ProviderOrFamily>[
          SketchElementProjectionProvider.$allTransitiveDependencies0,
          SketchElementProjectionProvider.$allTransitiveDependencies1,
        ],
        isAutoDispose: true,
      );

  SketchElementProjectionProvider call(TripId tripId) =>
      SketchElementProjectionProvider._(argument: tripId, from: this);

  @override
  String toString() => r'sketchElementProjectionProvider';
}
