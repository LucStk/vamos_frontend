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
        dependencies: <ProviderOrFamily>[mapSceneProvider],
        $allTransitiveDependencies: <ProviderOrFamily>{
          VisualTargetsProvider.$allTransitiveDependencies0,
          VisualTargetsProvider.$allTransitiveDependencies1,
          VisualTargetsProvider.$allTransitiveDependencies2,
          VisualTargetsProvider.$allTransitiveDependencies3,
          VisualTargetsProvider.$allTransitiveDependencies4,
          VisualTargetsProvider.$allTransitiveDependencies5,
          VisualTargetsProvider.$allTransitiveDependencies6,
          VisualTargetsProvider.$allTransitiveDependencies7,
          VisualTargetsProvider.$allTransitiveDependencies8,
          VisualTargetsProvider.$allTransitiveDependencies9,
          VisualTargetsProvider.$allTransitiveDependencies10,
          VisualTargetsProvider.$allTransitiveDependencies11,
          VisualTargetsProvider.$allTransitiveDependencies12,
          VisualTargetsProvider.$allTransitiveDependencies13,
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
  static final $allTransitiveDependencies13 =
      MapSceneProvider.$allTransitiveDependencies12;

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

String _$visualTargetsHash() => r'8734b87f46822062890b5bb8d4a27e9428e96f96';
