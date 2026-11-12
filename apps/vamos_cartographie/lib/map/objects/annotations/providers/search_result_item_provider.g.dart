// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result_item_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(searchResultItem)
final searchResultItemProvider = SearchResultItemFamily._();

final class SearchResultItemProvider
    extends
        $FunctionalProvider<
          SearchResultItem?,
          SearchResultItem?,
          SearchResultItem?
        >
    with $Provider<SearchResultItem?> {
  SearchResultItemProvider._({
    required SearchResultItemFamily super.from,
    required MapCameraReader super.argument,
  }) : super(
         retry: null,
         name: r'searchResultItemProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  static final $allTransitiveDependencies0 = modeSlotProvider;
  static final $allTransitiveDependencies1 =
      ModeSlotProvider.$allTransitiveDependencies0;

  @override
  String debugGetCreateSourceHash() => _$searchResultItemHash();

  @override
  String toString() {
    return r'searchResultItemProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<SearchResultItem?> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SearchResultItem? create(Ref ref) {
    final argument = this.argument as MapCameraReader;
    return searchResultItem(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SearchResultItem? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SearchResultItem?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SearchResultItemProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$searchResultItemHash() => r'0f48c79ac9e874567146547128120f02e4edd7ec';

final class SearchResultItemFamily extends $Family
    with $FunctionalFamilyOverride<SearchResultItem?, MapCameraReader> {
  SearchResultItemFamily._()
    : super(
        retry: null,
        name: r'searchResultItemProvider',
        dependencies: <ProviderOrFamily>[modeSlotProvider],
        $allTransitiveDependencies: <ProviderOrFamily>[
          SearchResultItemProvider.$allTransitiveDependencies0,
          SearchResultItemProvider.$allTransitiveDependencies1,
        ],
        isAutoDispose: false,
      );

  SearchResultItemProvider call(MapCameraReader camera) =>
      SearchResultItemProvider._(argument: camera, from: this);

  @override
  String toString() => r'searchResultItemProvider';
}
