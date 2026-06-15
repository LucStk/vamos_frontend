// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cursor_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MapCursorNotifier)
final mapCursorProvider = MapCursorNotifierProvider._();

final class MapCursorNotifierProvider
    extends $NotifierProvider<MapCursorNotifier, MapCursor> {
  MapCursorNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mapCursorProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mapCursorNotifierHash();

  @$internal
  @override
  MapCursorNotifier create() => MapCursorNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MapCursor value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MapCursor>(value),
    );
  }
}

String _$mapCursorNotifierHash() => r'17d0a90cfdb2325ff763a15ca064a0680bac050c';

abstract class _$MapCursorNotifier extends $Notifier<MapCursor> {
  MapCursor build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<MapCursor, MapCursor>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MapCursor, MapCursor>,
              MapCursor,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
