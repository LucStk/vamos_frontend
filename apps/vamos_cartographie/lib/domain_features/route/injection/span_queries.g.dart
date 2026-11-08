// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'span_queries.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(mobilitySpanNode)
final mobilitySpanNodeProvider = MobilitySpanNodeFamily._();

final class MobilitySpanNodeProvider
    extends
        $FunctionalProvider<
          GraphNode<MobilitySpanFields>,
          GraphNode<MobilitySpanFields>,
          GraphNode<MobilitySpanFields>
        >
    with $Provider<GraphNode<MobilitySpanFields>> {
  MobilitySpanNodeProvider._({
    required MobilitySpanNodeFamily super.from,
    required (TripId, MobilitySpanId) super.argument,
  }) : super(
         retry: null,
         name: r'mobilitySpanNodeProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$mobilitySpanNodeHash();

  @override
  String toString() {
    return r'mobilitySpanNodeProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<GraphNode<MobilitySpanFields>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GraphNode<MobilitySpanFields> create(Ref ref) {
    final argument = this.argument as (TripId, MobilitySpanId);
    return mobilitySpanNode(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GraphNode<MobilitySpanFields> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GraphNode<MobilitySpanFields>>(
        value,
      ),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is MobilitySpanNodeProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$mobilitySpanNodeHash() => r'c00f635758c0fc41301f5cf733d6298ff92a2667';

final class MobilitySpanNodeFamily extends $Family
    with
        $FunctionalFamilyOverride<
          GraphNode<MobilitySpanFields>,
          (TripId, MobilitySpanId)
        > {
  MobilitySpanNodeFamily._()
    : super(
        retry: null,
        name: r'mobilitySpanNodeProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  MobilitySpanNodeProvider call(TripId tripId, MobilitySpanId id) =>
      MobilitySpanNodeProvider._(argument: (tripId, id), from: this);

  @override
  String toString() => r'mobilitySpanNodeProvider';
}

@ProviderFor(mobilitySpan)
final mobilitySpanProvider = MobilitySpanFamily._();

final class MobilitySpanProvider
    extends
        $FunctionalProvider<
          MobilitySpanFields,
          MobilitySpanFields,
          MobilitySpanFields
        >
    with $Provider<MobilitySpanFields> {
  MobilitySpanProvider._({
    required MobilitySpanFamily super.from,
    required (TripId, MobilitySpanId) super.argument,
  }) : super(
         retry: null,
         name: r'mobilitySpanProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$mobilitySpanHash();

  @override
  String toString() {
    return r'mobilitySpanProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<MobilitySpanFields> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  MobilitySpanFields create(Ref ref) {
    final argument = this.argument as (TripId, MobilitySpanId);
    return mobilitySpan(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MobilitySpanFields value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MobilitySpanFields>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is MobilitySpanProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$mobilitySpanHash() => r'022d3f5834c3a976a19e7b9831fb7625d398f780';

final class MobilitySpanFamily extends $Family
    with
        $FunctionalFamilyOverride<
          MobilitySpanFields,
          (TripId, MobilitySpanId)
        > {
  MobilitySpanFamily._()
    : super(
        retry: null,
        name: r'mobilitySpanProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  MobilitySpanProvider call(TripId tripId, MobilitySpanId id) =>
      MobilitySpanProvider._(argument: (tripId, id), from: this);

  @override
  String toString() => r'mobilitySpanProvider';
}

/// Spans de modalité triés par `startIndex` : l'ordre de la route.
///
/// Ne se recalcule que si la collection change : un patch de la route seule
/// (titre…) ne relance pas le tri.

@ProviderFor(mobilitySpans)
final mobilitySpansProvider = MobilitySpansFamily._();

/// Spans de modalité triés par `startIndex` : l'ordre de la route.
///
/// Ne se recalcule que si la collection change : un patch de la route seule
/// (titre…) ne relance pas le tri.

final class MobilitySpansProvider
    extends
        $FunctionalProvider<
          List<MobilitySpanFields>,
          List<MobilitySpanFields>,
          List<MobilitySpanFields>
        >
    with $Provider<List<MobilitySpanFields>> {
  /// Spans de modalité triés par `startIndex` : l'ordre de la route.
  ///
  /// Ne se recalcule que si la collection change : un patch de la route seule
  /// (titre…) ne relance pas le tri.
  MobilitySpansProvider._({
    required MobilitySpansFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'mobilitySpansProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$mobilitySpansHash();

  @override
  String toString() {
    return r'mobilitySpansProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<List<MobilitySpanFields>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<MobilitySpanFields> create(Ref ref) {
    final argument = this.argument as TripId;
    return mobilitySpans(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<MobilitySpanFields> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<MobilitySpanFields>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is MobilitySpansProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$mobilitySpansHash() => r'd70ebaf2334aff7253384eaaec2f95f121854976';

/// Spans de modalité triés par `startIndex` : l'ordre de la route.
///
/// Ne se recalcule que si la collection change : un patch de la route seule
/// (titre…) ne relance pas le tri.

final class MobilitySpansFamily extends $Family
    with $FunctionalFamilyOverride<List<MobilitySpanFields>, TripId> {
  MobilitySpansFamily._()
    : super(
        retry: null,
        name: r'mobilitySpansProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  /// Spans de modalité triés par `startIndex` : l'ordre de la route.
  ///
  /// Ne se recalcule que si la collection change : un patch de la route seule
  /// (titre…) ne relance pas le tri.

  MobilitySpansProvider call(TripId tripId) =>
      MobilitySpansProvider._(argument: tripId, from: this);

  @override
  String toString() => r'mobilitySpansProvider';
}

/// Spans d'édition, déjà triés par `RouteStore`. Mode édition seulement.

@ProviderFor(editSpans)
final editSpansProvider = EditSpansFamily._();

/// Spans d'édition, déjà triés par `RouteStore`. Mode édition seulement.

final class EditSpansProvider
    extends $FunctionalProvider<List<EditSpan>, List<EditSpan>, List<EditSpan>>
    with $Provider<List<EditSpan>> {
  /// Spans d'édition, déjà triés par `RouteStore`. Mode édition seulement.
  EditSpansProvider._({
    required EditSpansFamily super.from,
    required TripId super.argument,
  }) : super(
         retry: null,
         name: r'editSpansProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$editSpansHash();

  @override
  String toString() {
    return r'editSpansProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<List<EditSpan>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<EditSpan> create(Ref ref) {
    final argument = this.argument as TripId;
    return editSpans(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<EditSpan> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<EditSpan>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is EditSpansProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$editSpansHash() => r'199790b9b11d02ca5cb49e900e94a134720e866a';

/// Spans d'édition, déjà triés par `RouteStore`. Mode édition seulement.

final class EditSpansFamily extends $Family
    with $FunctionalFamilyOverride<List<EditSpan>, TripId> {
  EditSpansFamily._()
    : super(
        retry: null,
        name: r'editSpansProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  /// Spans d'édition, déjà triés par `RouteStore`. Mode édition seulement.

  EditSpansProvider call(TripId tripId) =>
      EditSpansProvider._(argument: tripId, from: this);

  @override
  String toString() => r'editSpansProvider';
}
