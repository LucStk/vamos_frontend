// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visual_target.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(visualTargets)
final visualTargetsProvider = VisualTargetsProvider._();

final class VisualTargetsProvider
    extends
        $FunctionalProvider<
          Map<Object, MapObjectVisualState>,
          Map<Object, MapObjectVisualState>,
          Map<Object, MapObjectVisualState>
        >
    with $Provider<Map<Object, MapObjectVisualState>> {
  VisualTargetsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'visualTargetsProvider',
        isAutoDispose: true,
        dependencies: <ProviderOrFamily>[],
        $allTransitiveDependencies: <ProviderOrFamily>[],
      );

  @override
  String debugGetCreateSourceHash() => _$visualTargetsHash();

  @$internal
  @override
  $ProviderElement<Map<Object, MapObjectVisualState>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  Map<Object, MapObjectVisualState> create(Ref ref) {
    return visualTargets(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<Object, MapObjectVisualState> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<Object, MapObjectVisualState>>(
        value,
      ),
    );
  }
}

String _$visualTargetsHash() => r'74515452bb53ce884709d221971a8960bb79d214';
