import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final class LogObserver extends ProviderObserver {
  String _name(ProviderObserverContext c) =>
      c.provider.name ?? c.provider.runtimeType.toString();

  @override
  void didUpdateProvider(
    ProviderObserverContext context,
    Object? previousValue,
    Object? newValue,
  ) => debugPrint('UPDATE  ${_name(context)}');

  @override
  void didDisposeProvider(ProviderObserverContext context) =>
      debugPrint('DISPOSE ${_name(context)}');
}
