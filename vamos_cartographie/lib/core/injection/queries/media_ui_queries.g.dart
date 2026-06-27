// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_ui_queries.dart';

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
          List<ImageUiModel>,
          List<ImageUiModel>,
          List<ImageUiModel>
        >
    with $Provider<List<ImageUiModel>> {
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
  $ProviderElement<List<ImageUiModel>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<ImageUiModel> create(Ref ref) {
    final argument = this.argument as Id<dynamic>;
    return entityImages(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<ImageUiModel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<ImageUiModel>>(value),
    );
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

String _$entityImagesHash() => r'601627c40d8eeb16e45e89fb3a2e994f4ccfc932';

final class EntityImagesFamily extends $Family
    with $FunctionalFamilyOverride<List<ImageUiModel>, Id<dynamic>> {
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
