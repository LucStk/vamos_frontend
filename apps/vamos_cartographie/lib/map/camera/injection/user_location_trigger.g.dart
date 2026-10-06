// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_location_trigger.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(userLocationTrigger)
final userLocationTriggerProvider = UserLocationTriggerProvider._();

final class UserLocationTriggerProvider
    extends $FunctionalProvider<void, void, void>
    with $Provider<void> {
  UserLocationTriggerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userLocationTriggerProvider',
        isAutoDispose: true,
        dependencies: <ProviderOrFamily>[cameraDirectorProvider],
        $allTransitiveDependencies: <ProviderOrFamily>[
          UserLocationTriggerProvider.$allTransitiveDependencies0,
        ],
      );

  static final $allTransitiveDependencies0 = cameraDirectorProvider;

  @override
  String debugGetCreateSourceHash() => _$userLocationTriggerHash();

  @$internal
  @override
  $ProviderElement<void> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  void create(Ref ref) {
    return userLocationTrigger(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$userLocationTriggerHash() =>
    r'632a207785e57fa0a25bf3c27c44e6f1e4a7b468';
