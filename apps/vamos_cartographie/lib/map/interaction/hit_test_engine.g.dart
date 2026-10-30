// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hit_test_engine.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(hitTester)
final hitTesterProvider = HitTesterProvider._();

final class HitTesterProvider
    extends $FunctionalProvider<HitTester, HitTester, HitTester>
    with $Provider<HitTester> {
  HitTesterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hitTesterProvider',
        isAutoDispose: false,
        dependencies: <ProviderOrFamily>[mapSceneProvider],
        $allTransitiveDependencies: <ProviderOrFamily>{
          HitTesterProvider.$allTransitiveDependencies0,
          HitTesterProvider.$allTransitiveDependencies1,
          HitTesterProvider.$allTransitiveDependencies2,
          HitTesterProvider.$allTransitiveDependencies3,
          HitTesterProvider.$allTransitiveDependencies4,
          HitTesterProvider.$allTransitiveDependencies5,
          HitTesterProvider.$allTransitiveDependencies6,
          HitTesterProvider.$allTransitiveDependencies7,
          HitTesterProvider.$allTransitiveDependencies8,
          HitTesterProvider.$allTransitiveDependencies9,
          HitTesterProvider.$allTransitiveDependencies10,
          HitTesterProvider.$allTransitiveDependencies11,
          HitTesterProvider.$allTransitiveDependencies12,
        },
      );

  static final $allTransitiveDependencies0 = mapSceneProvider;
  static final $allTransitiveDependencies1 =
      MapSceneProvider.$allTransitiveDependencies0;
  static final $allTransitiveDependencies2 =
      MapSceneProvider.$allTransitiveDependencies1;
  static final $allTransitiveDependencies3 =
      MapSceneProvider.$allTransitiveDependencies2;
  static final $allTransitiveDependencies4 =
      MapSceneProvider.$allTransitiveDependencies3;
  static final $allTransitiveDependencies5 =
      MapSceneProvider.$allTransitiveDependencies4;
  static final $allTransitiveDependencies6 =
      MapSceneProvider.$allTransitiveDependencies5;
  static final $allTransitiveDependencies7 =
      MapSceneProvider.$allTransitiveDependencies6;
  static final $allTransitiveDependencies8 =
      MapSceneProvider.$allTransitiveDependencies7;
  static final $allTransitiveDependencies9 =
      MapSceneProvider.$allTransitiveDependencies8;
  static final $allTransitiveDependencies10 =
      MapSceneProvider.$allTransitiveDependencies9;
  static final $allTransitiveDependencies11 =
      MapSceneProvider.$allTransitiveDependencies10;
  static final $allTransitiveDependencies12 =
      MapSceneProvider.$allTransitiveDependencies11;

  @override
  String debugGetCreateSourceHash() => _$hitTesterHash();

  @$internal
  @override
  $ProviderElement<HitTester> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  HitTester create(Ref ref) {
    return hitTester(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HitTester value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HitTester>(value),
    );
  }
}

String _$hitTesterHash() => r'776b37fdfe008327dd5c114c6a14530239e727d0';
