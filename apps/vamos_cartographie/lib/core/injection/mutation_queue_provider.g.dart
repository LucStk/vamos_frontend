// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mutation_queue_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(mutationQueue)
final mutationQueueProvider = MutationQueueProvider._();

final class MutationQueueProvider
    extends
        $FunctionalProvider<
          MutationQueue<dynamic>,
          MutationQueue<dynamic>,
          MutationQueue<dynamic>
        >
    with $Provider<MutationQueue<dynamic>> {
  MutationQueueProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mutationQueueProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mutationQueueHash();

  @$internal
  @override
  $ProviderElement<MutationQueue<dynamic>> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  MutationQueue<dynamic> create(Ref ref) {
    return mutationQueue(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MutationQueue<dynamic> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MutationQueue<dynamic>>(value),
    );
  }
}

String _$mutationQueueHash() => r'b81a3f38628f158281c920c40fa1ce2e9b44ec7e';
