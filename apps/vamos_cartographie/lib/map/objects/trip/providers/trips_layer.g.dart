// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trips_layer.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Voyages choisis pour la vue courante (découverte), dessinés avec leur
/// aperçu simplifié à l'échelle de la vue. Les autres voyages chargés restent
/// en mémoire mais ne sont pas dessinés.

@ProviderFor(discoveredTripItems)
final discoveredTripItemsProvider = DiscoveredTripItemsFamily._();

/// Voyages choisis pour la vue courante (découverte), dessinés avec leur
/// aperçu simplifié à l'échelle de la vue. Les autres voyages chargés restent
/// en mémoire mais ne sont pas dessinés.

final class DiscoveredTripItemsProvider
    extends $FunctionalProvider<List<TripItem>, List<TripItem>, List<TripItem>>
    with $Provider<List<TripItem>> {
  /// Voyages choisis pour la vue courante (découverte), dessinés avec leur
  /// aperçu simplifié à l'échelle de la vue. Les autres voyages chargés restent
  /// en mémoire mais ne sont pas dessinés.
  DiscoveredTripItemsProvider._({
    required DiscoveredTripItemsFamily super.from,
    required MapCameraReader super.argument,
  }) : super(
         retry: null,
         name: r'discoveredTripItemsProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$discoveredTripItemsHash();

  @override
  String toString() {
    return r'discoveredTripItemsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<List<TripItem>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<TripItem> create(Ref ref) {
    final argument = this.argument as MapCameraReader;
    return discoveredTripItems(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<TripItem> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<TripItem>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is DiscoveredTripItemsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$discoveredTripItemsHash() =>
    r'fb4a06c69b51e73d46d9b01953063a9fddded8bb';

/// Voyages choisis pour la vue courante (découverte), dessinés avec leur
/// aperçu simplifié à l'échelle de la vue. Les autres voyages chargés restent
/// en mémoire mais ne sont pas dessinés.

final class DiscoveredTripItemsFamily extends $Family
    with $FunctionalFamilyOverride<List<TripItem>, MapCameraReader> {
  DiscoveredTripItemsFamily._()
    : super(
        retry: null,
        name: r'discoveredTripItemsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  /// Voyages choisis pour la vue courante (découverte), dessinés avec leur
  /// aperçu simplifié à l'échelle de la vue. Les autres voyages chargés restent
  /// en mémoire mais ne sont pas dessinés.

  DiscoveredTripItemsProvider call(MapCameraReader camera) =>
      DiscoveredTripItemsProvider._(argument: camera, from: this);

  @override
  String toString() => r'discoveredTripItemsProvider';
}
