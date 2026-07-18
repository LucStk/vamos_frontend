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
         isAutoDispose: true,
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

String _$storedFileNodeHash() => r'e64d5e3b307ae65623f0d900326769737799e1e7';

final class StoredFileNodeFamily extends $Family
    with $FunctionalFamilyOverride<GraphNode<StoredFileFields>, StoredFileId> {
  StoredFileNodeFamily._()
    : super(
        retry: null,
        name: r'storedFileNodeProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
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
         isAutoDispose: true,
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

String _$storeFileHash() => r'bffa8a864ce393018de7406eccc59d1a0ebef456';

final class StoreFileFamily extends $Family
    with $FunctionalFamilyOverride<StoredFileFields, StoredFileId> {
  StoreFileFamily._()
    : super(
        retry: null,
        name: r'storeFileProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  StoreFileProvider call(StoredFileId fileId) =>
      StoreFileProvider._(argument: fileId, from: this);

  @override
  String toString() => r'storeFileProvider';
}
