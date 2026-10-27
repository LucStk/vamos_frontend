// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stored_file_queries.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(storedFileNode)
final storedFileNodeProvider = StoredFileNodeFamily._();

final class StoredFileNodeProvider
    extends
        $FunctionalProvider<
          GraphNode<StoredFileFields>,
          GraphNode<StoredFileFields>,
          GraphNode<StoredFileFields>
        >
    with $Provider<GraphNode<StoredFileFields>> {
  StoredFileNodeProvider._({
    required StoredFileNodeFamily super.from,
    required StoredFileId super.argument,
  }) : super(
         retry: null,
         name: r'storedFileNodeProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$storedFileNodeHash();

  @override
  String toString() {
    return r'storedFileNodeProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<GraphNode<StoredFileFields>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GraphNode<StoredFileFields> create(Ref ref) {
    final argument = this.argument as StoredFileId;
    return storedFileNode(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GraphNode<StoredFileFields> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GraphNode<StoredFileFields>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is StoredFileNodeProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$storedFileNodeHash() => r'036359f7ba130fc9dec0a6b30d87272149cca11b';

final class StoredFileNodeFamily extends $Family
    with $FunctionalFamilyOverride<GraphNode<StoredFileFields>, StoredFileId> {
  StoredFileNodeFamily._()
    : super(
        retry: null,
        name: r'storedFileNodeProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  StoredFileNodeProvider call(StoredFileId fileId) =>
      StoredFileNodeProvider._(argument: fileId, from: this);

  @override
  String toString() => r'storedFileNodeProvider';
}

@ProviderFor(storeFile)
final storeFileProvider = StoreFileFamily._();

final class StoreFileProvider
    extends
        $FunctionalProvider<
          StoredFileFields,
          StoredFileFields,
          StoredFileFields
        >
    with $Provider<StoredFileFields> {
  StoreFileProvider._({
    required StoreFileFamily super.from,
    required StoredFileId super.argument,
  }) : super(
         retry: null,
         name: r'storeFileProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$storeFileHash();

  @override
  String toString() {
    return r'storeFileProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<StoredFileFields> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  StoredFileFields create(Ref ref) {
    final argument = this.argument as StoredFileId;
    return storeFile(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(StoredFileFields value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<StoredFileFields>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is StoreFileProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$storeFileHash() => r'9f75be1e5d85e6e30d8f4ad2e6add50f5be001ba';

final class StoreFileFamily extends $Family
    with $FunctionalFamilyOverride<StoredFileFields, StoredFileId> {
  StoreFileFamily._()
    : super(
        retry: null,
        name: r'storeFileProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  StoreFileProvider call(StoredFileId fileId) =>
      StoreFileProvider._(argument: fileId, from: this);

  @override
  String toString() => r'storeFileProvider';
}

@ProviderFor(tripImages)
final tripImagesProvider = TripImagesFamily._();

final class TripImagesProvider
    extends
        $FunctionalProvider<
          List<StoredFileFields>,
          List<StoredFileFields>,
          List<StoredFileFields>
        >
    with $Provider<List<StoredFileFields>> {
  TripImagesProvider._({
    required TripImagesFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'tripImagesProvider',
         isAutoDispose: false,
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
  $ProviderElement<List<StoredFileFields>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<StoredFileFields> create(Ref ref) {
    final argument = this.argument as TripId;
    return tripImages(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<StoredFileFields> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<StoredFileFields>>(value),
    );
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

String _$tripImagesHash() => r'0655099799a4734899dd03bd482efffe0adf6c67';

final class TripImagesFamily extends $Family
    with $FunctionalFamilyOverride<List<StoredFileFields>, TripId> {
  TripImagesFamily._()
    : super(
        retry: null,
        name: r'tripImagesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  TripImagesProvider call(TripId tripId) =>
      TripImagesProvider._(argument: tripId, from: this);

  @override
  String toString() => r'tripImagesProvider';
}
