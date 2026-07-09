// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trip_handler.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

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

String _$tripHandlerHash() => r'fe649679eeb5054195845b4fdac9f29f06750251';
