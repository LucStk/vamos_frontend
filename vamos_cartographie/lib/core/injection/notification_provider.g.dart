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

String _$notificationQueueHash() => r'c99c63a1c4d5823afac9490bac236f7c509da485';

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
