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
    required List<MediaImage> super.argument,
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

String _$carouselNotifierHash() => r'86535ca0daa6b69e6c484fadfe7b4f0301f11c7b';

final class CarouselNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          CarouselNotifier,
          CarouselState,
          CarouselState,
          CarouselState,
          List<MediaImage>
        > {
  CarouselNotifierFamily._()
    : super(
        retry: null,
        name: r'carouselProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CarouselNotifierProvider call(List<MediaImage> initialImages) =>
      CarouselNotifierProvider._(argument: initialImages, from: this);

  @override
  String toString() => r'carouselProvider';
}

abstract class _$CarouselNotifier extends $Notifier<CarouselState> {
  late final _$args = ref.$arg as List<MediaImage>;
  List<MediaImage> get initialImages => _$args;

  CarouselState build(List<MediaImage> initialImages);
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
