// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dio_media_handler.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DioMediaHandler)
final dioMediaHandlerProvider = DioMediaHandlerProvider._();

final class DioMediaHandlerProvider
    extends $NotifierProvider<DioMediaHandler, void> {
  DioMediaHandlerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dioMediaHandlerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dioMediaHandlerHash();

  @$internal
  @override
  DioMediaHandler create() => DioMediaHandler();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$dioMediaHandlerHash() => r'115cc97387d2e29a93b9410ddf1bdf3820203432';

abstract class _$DioMediaHandler extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
