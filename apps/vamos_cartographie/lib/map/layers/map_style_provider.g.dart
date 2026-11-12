// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_style_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(mapStyle)
final mapStyleProvider = MapStyleProvider._();

final class MapStyleProvider
    extends
        $FunctionalProvider<AsyncValue<vt.Style>, vt.Style, FutureOr<vt.Style>>
    with $FutureModifier<vt.Style>, $FutureProvider<vt.Style> {
  MapStyleProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mapStyleProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mapStyleHash();

  @$internal
  @override
  $FutureProviderElement<vt.Style> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<vt.Style> create(Ref ref) {
    return mapStyle(ref);
  }
}

String _$mapStyleHash() => r'd8ba7e35515c5d466c4ef3d97c6d0f292b2090d7';
