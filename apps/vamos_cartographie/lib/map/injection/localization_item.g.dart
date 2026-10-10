// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localization_item.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(localizationItem)
final localizationItemProvider = LocalizationItemFamily._();

final class LocalizationItemProvider
    extends
        $FunctionalProvider<
          LocalizationItem?,
          LocalizationItem?,
          LocalizationItem?
        >
    with $Provider<LocalizationItem?> {
  LocalizationItemProvider._({
    required LocalizationItemFamily super.from,
    required MapCameraReader super.argument,
  }) : super(
         retry: null,
         name: r'localizationItemProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$localizationItemHash();

  @override
  String toString() {
    return r'localizationItemProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<LocalizationItem?> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LocalizationItem? create(Ref ref) {
    final argument = this.argument as MapCameraReader;
    return localizationItem(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalizationItem? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalizationItem?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is LocalizationItemProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$localizationItemHash() => r'817cad34a09a9783a2d3129814bec8f13e65f22b';

final class LocalizationItemFamily extends $Family
    with $FunctionalFamilyOverride<LocalizationItem?, MapCameraReader> {
  LocalizationItemFamily._()
    : super(
        retry: null,
        name: r'localizationItemProvider',
        dependencies: <ProviderOrFamily>[],
        $allTransitiveDependencies: <ProviderOrFamily>[],
        isAutoDispose: false,
      );

  LocalizationItemProvider call(MapCameraReader camera) =>
      LocalizationItemProvider._(argument: camera, from: this);

  @override
  String toString() => r'localizationItemProvider';
}
