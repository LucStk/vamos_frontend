// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dio_media_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dioMedia)
final dioMediaProvider = DioMediaProvider._();

final class DioMediaProvider
    extends
        $FunctionalProvider<
          StorageDatasource,
          StorageDatasource,
          StorageDatasource
        >
    with $Provider<StorageDatasource> {
  DioMediaProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dioMediaProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dioMediaHash();

  @$internal
  @override
  $ProviderElement<StorageDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  StorageDatasource create(Ref ref) {
    return dioMedia(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StorageDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StorageDatasource>(value),
    );
  }
}

String _$dioMediaHash() => r'6f510b3bb9fd7c65e0a5b0876a0773a242402eaa';
