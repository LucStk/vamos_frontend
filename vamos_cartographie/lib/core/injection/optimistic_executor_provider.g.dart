// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'optimistic_executor_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(optimisticExecutor)
final optimisticExecutorProvider = OptimisticExecutorProvider._();

final class OptimisticExecutorProvider
    extends
        $FunctionalProvider<
          OptimisticExecutor,
          OptimisticExecutor,
          OptimisticExecutor
        >
    with $Provider<OptimisticExecutor> {
  OptimisticExecutorProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'optimisticExecutorProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$optimisticExecutorHash();

  @$internal
  @override
  $ProviderElement<OptimisticExecutor> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  OptimisticExecutor create(Ref ref) {
    return optimisticExecutor(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OptimisticExecutor value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OptimisticExecutor>(value),
    );
  }
}

String _$optimisticExecutorHash() =>
    r'9f48b8c2226a31bd3b515694c0b791c9cebd8b7d';
