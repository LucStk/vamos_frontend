// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_queries.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tripImages)
final tripImagesProvider = TripImagesFamily._();

final class TripImagesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ImageUiModel>>,
          List<ImageUiModel>,
          FutureOr<List<ImageUiModel>>
        >
    with
        $FutureModifier<List<ImageUiModel>>,
        $FutureProvider<List<ImageUiModel>> {
  TripImagesProvider._({
    required TripImagesFamily super.from,
    required Id<dynamic> super.argument,
  }) : super(
         retry: null,
         name: r'tripImagesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$tripImagesHash();

  @override
  String toString() {
    return r'tripImagesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<ImageUiModel>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<ImageUiModel>> create(Ref ref) {
    final argument = this.argument as Id<dynamic>;
    return tripImages(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is TripImagesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$tripImagesHash() => r'375ea3c1371b80e37ee7202747721965c415182c';

final class TripImagesFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<ImageUiModel>>, Id<dynamic>> {
  TripImagesFamily._()
    : super(
        retry: null,
        name: r'tripImagesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TripImagesProvider call(Id<dynamic> id) =>
      TripImagesProvider._(argument: id, from: this);

  @override
  String toString() => r'tripImagesProvider';
}
