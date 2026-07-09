// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(NotificationQueue)
final notificationQueueProvider = NotificationQueueProvider._();

final class NotificationQueueProvider
    extends $NotifierProvider<NotificationQueue, AppNotification?> {
  NotificationQueueProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'notificationQueueProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$notificationQueueHash();

  @$internal
  @override
  NotificationQueue create() => NotificationQueue();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppNotification? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppNotification?>(value),
    );
  }
}

String _$notificationQueueHash() => r'6095c84418061131160fc3a9b130417b9a2bb091';

abstract class _$NotificationQueue extends $Notifier<AppNotification?> {
  AppNotification? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AppNotification?, AppNotification?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AppNotification?, AppNotification?>,
              AppNotification?,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
