// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ClientNotifier)
final clientProvider = ClientNotifierProvider._();

final class ClientNotifierProvider
    extends $NotifierProvider<ClientNotifier, Client> {
  ClientNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'clientProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$clientNotifierHash();

  @$internal
  @override
  ClientNotifier create() => ClientNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Client value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Client>(value),
    );
  }
}

String _$clientNotifierHash() => r'3648755f4d7c0edb84093634e16b55735f3fd3a1';

abstract class _$ClientNotifier extends $Notifier<Client> {
  Client build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<Client, Client>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Client, Client>,
              Client,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
