// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section_queries.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(sectionNode)
final sectionNodeProvider = SectionNodeFamily._();

final class SectionNodeProvider
    extends
        $FunctionalProvider<
          GraphNode<RouteSectionFields>,
          GraphNode<RouteSectionFields>,
          GraphNode<RouteSectionFields>
        >
    with $Provider<GraphNode<RouteSectionFields>> {
  SectionNodeProvider._({
    required SectionNodeFamily super.from,
    required (TripId, SectionId) super.argument,
  }) : super(
         retry: null,
         name: r'sectionNodeProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$sectionNodeHash();

  @override
  String toString() {
    return r'sectionNodeProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<GraphNode<RouteSectionFields>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GraphNode<RouteSectionFields> create(Ref ref) {
    final argument = this.argument as (TripId, SectionId);
    return sectionNode(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GraphNode<RouteSectionFields> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GraphNode<RouteSectionFields>>(
        value,
      ),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SectionNodeProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$sectionNodeHash() => r'128c181d9383af64ac7d1a43842da6e865673680';

final class SectionNodeFamily extends $Family
    with
        $FunctionalFamilyOverride<
          GraphNode<RouteSectionFields>,
          (TripId, SectionId)
        > {
  SectionNodeFamily._()
    : super(
        retry: null,
        name: r'sectionNodeProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  SectionNodeProvider call(TripId tripId, SectionId id) =>
      SectionNodeProvider._(argument: (tripId, id), from: this);

  @override
  String toString() => r'sectionNodeProvider';
}

@ProviderFor(section)
final sectionProvider = SectionFamily._();

final class SectionProvider
    extends
        $FunctionalProvider<
          RouteSectionFields,
          RouteSectionFields,
          RouteSectionFields
        >
    with $Provider<RouteSectionFields> {
  SectionProvider._({
    required SectionFamily super.from,
    required (TripId, SectionId) super.argument,
  }) : super(
         retry: null,
         name: r'sectionProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$sectionHash();

  @override
  String toString() {
    return r'sectionProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<RouteSectionFields> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  RouteSectionFields create(Ref ref) {
    final argument = this.argument as (TripId, SectionId);
    return section(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RouteSectionFields value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RouteSectionFields>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is SectionProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$sectionHash() => r'3f72b1f303cbde621f1f57732a1682715e81a3c3';

final class SectionFamily extends $Family
    with $FunctionalFamilyOverride<RouteSectionFields, (TripId, SectionId)> {
  SectionFamily._()
    : super(
        retry: null,
        name: r'sectionProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  SectionProvider call(TripId tripId, SectionId id) =>
      SectionProvider._(argument: (tripId, id), from: this);

  @override
  String toString() => r'sectionProvider';
}

@ProviderFor(allSections)
final allSectionsProvider = AllSectionsFamily._();

final class AllSectionsProvider
    extends
        $FunctionalProvider<
          List<RouteSectionFields>,
          List<RouteSectionFields>,
          List<RouteSectionFields>
        >
    with $Provider<List<RouteSectionFields>> {
  AllSectionsProvider._({
    required AllSectionsFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'allSectionsProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$allSectionsHash();

  @override
  String toString() {
    return r'allSectionsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<List<RouteSectionFields>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<RouteSectionFields> create(Ref ref) {
    final argument = this.argument as TripId;
    return allSections(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<RouteSectionFields> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<RouteSectionFields>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is AllSectionsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$allSectionsHash() => r'5c147497999c32c037d58679c189dc573cc2990e';

final class AllSectionsFamily extends $Family
    with $FunctionalFamilyOverride<List<RouteSectionFields>, TripId> {
  AllSectionsFamily._()
    : super(
        retry: null,
        name: r'allSectionsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  AllSectionsProvider call(TripId tripId) =>
      AllSectionsProvider._(argument: tripId, from: this);

  @override
  String toString() => r'allSectionsProvider';
}
