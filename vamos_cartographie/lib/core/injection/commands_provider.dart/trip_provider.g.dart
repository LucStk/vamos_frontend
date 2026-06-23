// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(tripRemoteDatasource)
final tripRemoteDatasourceProvider = TripRemoteDatasourceProvider._();

final class TripRemoteDatasourceProvider
    extends
        $FunctionalProvider<
          TripRemoteDatasource,
          TripRemoteDatasource,
          TripRemoteDatasource
        >
    with $Provider<TripRemoteDatasource> {
  TripRemoteDatasourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tripRemoteDatasourceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tripRemoteDatasourceHash();

  @$internal
  @override
  $ProviderElement<TripRemoteDatasource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  TripRemoteDatasource create(Ref ref) {
    return tripRemoteDatasource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TripRemoteDatasource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TripRemoteDatasource>(value),
    );
  }
}

String _$tripRemoteDatasourceHash() =>
    r'901b1a49c05698679fe4e901f76731522489b50a';

@ProviderFor(tripRepository)
final tripRepositoryProvider = TripRepositoryProvider._();

final class TripRepositoryProvider
    extends $FunctionalProvider<TripRepository, TripRepository, TripRepository>
    with $Provider<TripRepository> {
  TripRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tripRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tripRepositoryHash();

  @$internal
  @override
  $ProviderElement<TripRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TripRepository create(Ref ref) {
    return tripRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TripRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TripRepository>(value),
    );
  }
}

String _$tripRepositoryHash() => r'faf61679c894cea032e294dc345fdaf776d938d6';

@ProviderFor(tripHandler)
final tripHandlerProvider = TripHandlerProvider._();

final class TripHandlerProvider
    extends $FunctionalProvider<TripHandler, TripHandler, TripHandler>
    with $Provider<TripHandler> {
  TripHandlerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tripHandlerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tripHandlerHash();

  @$internal
  @override
  $ProviderElement<TripHandler> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TripHandler create(Ref ref) {
    return tripHandler(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TripHandler value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TripHandler>(value),
    );
  }
}

String _$tripHandlerHash() => r'077bd56f08e34fff866c3410bcde341fd75b354f';

@ProviderFor(tripImages)
final tripImagesProvider = TripImagesFamily._();

final class TripImagesProvider
    extends
        $FunctionalProvider<
          List<ImageUiModel>,
          List<ImageUiModel>,
          List<ImageUiModel>
        >
    with $Provider<List<ImageUiModel>> {
  TripImagesProvider._({
    required TripImagesFamily super.from,
    required TripId super.argument,
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
  $ProviderElement<List<ImageUiModel>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<ImageUiModel> create(Ref ref) {
    final argument = this.argument as TripId;
    return tripImages(ref, argument);
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
    return other is TripImagesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$tripImagesHash() => r'e3fa6d4b7d560486a0fc794cb53752d6df67b3c3';

final class TripImagesFamily extends $Family
    with $FunctionalFamilyOverride<List<ImageUiModel>, TripId> {
  TripImagesFamily._()
    : super(
        retry: null,
        name: r'tripImagesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TripImagesProvider call(TripId tripId) =>
      TripImagesProvider._(argument: tripId, from: this);

  @override
  String toString() => r'tripImagesProvider';
}
