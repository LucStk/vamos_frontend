// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_queries.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(entityImages)
final entityImagesProvider = EntityImagesFamily._();

final class EntityImagesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ImageUiModel>>,
          List<ImageUiModel>,
          FutureOr<List<ImageUiModel>>
        >
    with
        $FutureModifier<List<ImageUiModel>>,
        $FutureProvider<List<ImageUiModel>> {
  EntityImagesProvider._({
    required EntityImagesFamily super.from,
    required Id<dynamic> super.argument,
  }) : super(
         retry: null,
         name: r'entityImagesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$entityImagesHash();

  @override
  String toString() {
    return r'entityImagesProvider'
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
    return entityImages(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is EntityImagesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$entityImagesHash() => r'5339acac779a1f93101cf1a2242f974bebee2de7';

final class EntityImagesFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<ImageUiModel>>, Id<dynamic>> {
  EntityImagesFamily._()
    : super(
        retry: null,
        name: r'entityImagesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  EntityImagesProvider call(Id<dynamic> id) =>
      EntityImagesProvider._(argument: id, from: this);

  @override
  String toString() => r'entityImagesProvider';
}
