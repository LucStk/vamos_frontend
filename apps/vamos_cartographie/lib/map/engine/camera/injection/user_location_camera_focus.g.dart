// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_location_camera_focus.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(userLocationCameraFocus)
final userLocationCameraFocusProvider = UserLocationCameraFocusProvider._();

final class UserLocationCameraFocusProvider
    extends $FunctionalProvider<void, void, void>
    with $Provider<void> {
  UserLocationCameraFocusProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userLocationCameraFocusProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userLocationCameraFocusHash();

  @$internal
  @override
  $ProviderElement<void> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  void create(Ref ref) {
    return userLocationCameraFocus(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$userLocationCameraFocusHash() =>
    r'58cae18f5aff51ddd17e89856ea4c42a63aa5d96';
