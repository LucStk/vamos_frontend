// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_search_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PlaceSearch)
final placeSearchProvider = PlaceSearchProvider._();

final class PlaceSearchProvider
    extends $NotifierProvider<PlaceSearch, PlaceSearchState> {
  PlaceSearchProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'placeSearchProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$placeSearchHash();

  @$internal
  @override
  PlaceSearch create() => PlaceSearch();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PlaceSearchState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PlaceSearchState>(value),
    );
  }
}

String _$placeSearchHash() => r'1df0e5ea5a84170e99ff34edee85993e737ef9a4';

abstract class _$PlaceSearch extends $Notifier<PlaceSearchState> {
  PlaceSearchState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<PlaceSearchState, PlaceSearchState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<PlaceSearchState, PlaceSearchState>,
              PlaceSearchState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
