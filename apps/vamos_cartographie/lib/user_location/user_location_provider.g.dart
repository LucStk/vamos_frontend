// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_location_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UserLocationNotifier)
final userLocationProvider = UserLocationNotifierProvider._();

final class UserLocationNotifierProvider
    extends $NotifierProvider<UserLocationNotifier, UserLocation?> {
  UserLocationNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userLocationProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userLocationNotifierHash();

  @$internal
  @override
  UserLocationNotifier create() => UserLocationNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserLocation? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserLocation?>(value),
    );
  }
}

String _$userLocationNotifierHash() =>
    r'3225c96816aa19ad803045ec4d3e091894dd36ff';

abstract class _$UserLocationNotifier extends $Notifier<UserLocation?> {
  UserLocation? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<UserLocation?, UserLocation?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<UserLocation?, UserLocation?>,
              UserLocation?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
