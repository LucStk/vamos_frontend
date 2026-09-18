// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(BaseModeNotifier)
final baseModeProvider = BaseModeNotifierProvider._();

final class BaseModeNotifierProvider
    extends $NotifierProvider<BaseModeNotifier, BaseMode> {
  BaseModeNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'baseModeProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$baseModeNotifierHash();

  @$internal
  @override
  BaseModeNotifier create() => BaseModeNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BaseMode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BaseMode>(value),
    );
  }
}

String _$baseModeNotifierHash() => r'e7c7f97807796b54fd634a6960d5c7bb88694f7d';

abstract class _$BaseModeNotifier extends $Notifier<BaseMode> {
  BaseMode build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<BaseMode, BaseMode>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<BaseMode, BaseMode>,
              BaseMode,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(baseController)
final baseControllerProvider = BaseControllerProvider._();

final class BaseControllerProvider
    extends
        $FunctionalProvider<
          BaseController<BaseMode>,
          BaseController<BaseMode>,
          BaseController<BaseMode>
        >
    with $Provider<BaseController<BaseMode>> {
  BaseControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'baseControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$baseControllerHash();

  @$internal
  @override
  $ProviderElement<BaseController<BaseMode>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  BaseController<BaseMode> create(Ref ref) {
    return baseController(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BaseController<BaseMode> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BaseController<BaseMode>>(value),
    );
  }
}

String _$baseControllerHash() => r'aca3c397c15a5c4f93ac17bb492b89e2d46ea7c5';
