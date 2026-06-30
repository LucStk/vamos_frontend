// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_ui_queries.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(visibleImages)
final visibleImagesProvider = VisibleImagesFamily._();

final class VisibleImagesProvider
    extends
        $FunctionalProvider<
          List<ImageUiModel>,
          List<ImageUiModel>,
          List<ImageUiModel>
        >
    with $Provider<List<ImageUiModel>> {
  VisibleImagesProvider._({
    required VisibleImagesFamily super.from,
    required Id<dynamic> super.argument,
  }) : super(
         retry: null,
         name: r'visibleImagesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$visibleImagesHash();

  @override
  String toString() {
    return r'visibleImagesProvider'
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
    return visibleImages(ref, argument);
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
    return other is VisibleImagesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$visibleImagesHash() => r'46f7af2e993f99fd1703d388b8c08b941514978a';

final class VisibleImagesFamily extends $Family
    with $FunctionalFamilyOverride<List<ImageUiModel>, Id<dynamic>> {
  VisibleImagesFamily._()
    : super(
        retry: null,
        name: r'visibleImagesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  VisibleImagesProvider call(Id<dynamic> id) =>
      VisibleImagesProvider._(argument: id, from: this);

  @override
  String toString() => r'visibleImagesProvider';
}

@ProviderFor(syncedImages)
final syncedImagesProvider = SyncedImagesFamily._();

final class SyncedImagesProvider
    extends
        $FunctionalProvider<
          List<ImageUiModel>,
          List<ImageUiModel>,
          List<ImageUiModel>
        >
    with $Provider<List<ImageUiModel>> {
  SyncedImagesProvider._({
    required SyncedImagesFamily super.from,
    required Id<dynamic> super.argument,
  }) : super(
         retry: null,
         name: r'syncedImagesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$syncedImagesHash();

  @override
  String toString() {
    return r'syncedImagesProvider'
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
    return syncedImages(ref, argument);
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
    return other is SyncedImagesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$syncedImagesHash() => r'23637f6ce0f32a30e6508ac6d433e9758b836364';

final class SyncedImagesFamily extends $Family
    with $FunctionalFamilyOverride<List<ImageUiModel>, Id<dynamic>> {
  SyncedImagesFamily._()
    : super(
        retry: null,
        name: r'syncedImagesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SyncedImagesProvider call(Id<dynamic> id) =>
      SyncedImagesProvider._(argument: id, from: this);

  @override
  String toString() => r'syncedImagesProvider';
}
