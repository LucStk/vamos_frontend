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

@ProviderFor(tripMediaHandler)
final tripMediaHandlerProvider = TripMediaHandlerProvider._();

final class TripMediaHandlerProvider
    extends $FunctionalProvider<MediaHandler, MediaHandler, MediaHandler>
    with $Provider<MediaHandler> {
  TripMediaHandlerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tripMediaHandlerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tripMediaHandlerHash();

  @$internal
  @override
  $ProviderElement<MediaHandler> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  MediaHandler create(Ref ref) {
    return tripMediaHandler(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MediaHandler value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MediaHandler>(value),
    );
  }
}

String _$tripMediaHandlerHash() => r'3de3bfe9416781b62c2e307baff08219c1e7c58b';
