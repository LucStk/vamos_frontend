// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_logger.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(errorLogger)
final errorLoggerProvider = ErrorLoggerProvider._();

final class ErrorLoggerProvider
    extends $FunctionalProvider<ErrorLogger, ErrorLogger, ErrorLogger>
    with $Provider<ErrorLogger> {
  ErrorLoggerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'errorLoggerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$errorLoggerHash();

  @$internal
  @override
  $ProviderElement<ErrorLogger> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ErrorLogger create(Ref ref) {
    return errorLogger(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ErrorLogger value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ErrorLogger>(value),
    );
  }
}

String _$errorLoggerHash() => r'18db1a676a940790c15710ca6e6cbaf8d1b7cc9e';
