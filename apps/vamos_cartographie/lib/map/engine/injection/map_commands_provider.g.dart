// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_commands_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(mapCommands)
final mapCommandsProvider = MapCommandsFamily._();

final class MapCommandsProvider
    extends
        $FunctionalProvider<
          List<MapDrawCommand>,
          List<MapDrawCommand>,
          List<MapDrawCommand>
        >
    with $Provider<List<MapDrawCommand>> {
  MapCommandsProvider._({
    required MapCommandsFamily super.from,
    required ProviderListenable<MapScene> super.argument,
  }) : super(
         retry: null,
         name: r'mapCommandsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$mapCommandsHash();

  @override
  String toString() {
    return r'mapCommandsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<List<MapDrawCommand>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<MapDrawCommand> create(Ref ref) {
    final argument = this.argument as ProviderListenable<MapScene>;
    return mapCommands(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<MapDrawCommand> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<MapDrawCommand>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is MapCommandsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$mapCommandsHash() => r'73d4fdf5c74415db7d886055edb353526bcdaab3';

final class MapCommandsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          List<MapDrawCommand>,
          ProviderListenable<MapScene>
        > {
  MapCommandsFamily._()
    : super(
        retry: null,
        name: r'mapCommandsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MapCommandsProvider call(ProviderListenable<MapScene> sceneProvider) =>
      MapCommandsProvider._(argument: sceneProvider, from: this);

  @override
  String toString() => r'mapCommandsProvider';
}
