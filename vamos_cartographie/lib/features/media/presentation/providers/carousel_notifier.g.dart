// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carousel_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CarouselNotifier)
final carouselProvider = CarouselNotifierProvider._();

final class CarouselNotifierProvider
    extends $NotifierProvider<CarouselNotifier, CarouselState> {
  CarouselNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'carouselProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$carouselNotifierHash();

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
}

String _$carouselNotifierHash() => r'8cf7f98bb013ed441d223147964bddcb29932e49';

abstract class _$CarouselNotifier extends $Notifier<CarouselState> {
  CarouselState build();
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
    element.handleCreate(ref, build);
  }
}
