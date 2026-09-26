// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_location_projecter.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(userLocationProjection)
final userLocationProjectionProvider = UserLocationProjectionProvider._();

final class UserLocationProjectionProvider
    extends
        $FunctionalProvider<
          List<ProjectedPoint<MapPoint>>,
          List<ProjectedPoint<MapPoint>>,
          List<ProjectedPoint<MapPoint>>
        >
    with $Provider<List<ProjectedPoint<MapPoint>>> {
  UserLocationProjectionProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userLocationProjectionProvider',
        isAutoDispose: false,
        dependencies: <ProviderOrFamily>[
          mapCameraProvider,
          cameraOrNullProvider,
        ],
        $allTransitiveDependencies: <ProviderOrFamily>[
          UserLocationProjectionProvider.$allTransitiveDependencies0,
          UserLocationProjectionProvider.$allTransitiveDependencies1,
        ],
      );

  static final $allTransitiveDependencies0 = mapCameraProvider;
  static final $allTransitiveDependencies1 = cameraOrNullProvider;

  @override
  String debugGetCreateSourceHash() => _$userLocationProjectionHash();

  @$internal
  @override
  $ProviderElement<List<ProjectedPoint<MapPoint>>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  List<ProjectedPoint<MapPoint>> create(Ref ref) {
    return userLocationProjection(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<ProjectedPoint<MapPoint>> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<ProjectedPoint<MapPoint>>>(
        value,
      ),
    );
  }
}

String _$userLocationProjectionHash() =>
    r'd5ff9feba5c0e867baef9376b1e29b555d1f1cf7';
