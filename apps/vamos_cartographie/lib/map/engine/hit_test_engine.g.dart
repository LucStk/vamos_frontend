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
        dependencies: null,
        $allTransitiveDependencies: null,
      );

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

String _$hitTesterHash() => r'9ae6185ef626bfa24ea0ca2449208e04297ee2fd';
