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
    extends $NotifierProvider<UserLocationNotifier, UserLocationState> {
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
  Override overrideWithValue(UserLocationState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserLocationState>(value),
    );
  }
}

String _$userLocationNotifierHash() =>
    r'9a271d5c0cd0814a529d0bf41c7fa7de9ae72406';

abstract class _$UserLocationNotifier extends $Notifier<UserLocationState> {
  UserLocationState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<UserLocationState, UserLocationState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<UserLocationState, UserLocationState>,
              UserLocationState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
