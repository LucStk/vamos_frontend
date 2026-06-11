// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carousel_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CarouselNotifier)
final carouselProvider = CarouselNotifierFamily._();

final class CarouselNotifierProvider
    extends $NotifierProvider<CarouselNotifier, CarouselState> {
  CarouselNotifierProvider._({
    required CarouselNotifierFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'carouselProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$carouselNotifierHash();

  @override
  String toString() {
    return r'carouselProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  CarouselNotifier create() => CarouselNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CarouselState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CarouselState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CarouselNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$carouselNotifierHash() => r'dc959221d062dd21bbca056e1d107b04ddd8c1f2';

final class CarouselNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          CarouselNotifier,
          CarouselState,
          CarouselState,
          CarouselState,
          String
        > {
  CarouselNotifierFamily._()
    : super(
        retry: null,
        name: r'carouselProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CarouselNotifierProvider call(String carouselId) =>
      CarouselNotifierProvider._(argument: carouselId, from: this);

  @override
  String toString() => r'carouselProvider';
}

abstract class _$CarouselNotifier extends $Notifier<CarouselState> {
  late final _$args = ref.$arg as String;
  String get carouselId => _$args;

  CarouselState build(String carouselId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<CarouselState, CarouselState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CarouselState, CarouselState>,
              CarouselState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
