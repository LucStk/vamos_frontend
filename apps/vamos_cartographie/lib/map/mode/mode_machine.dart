import 'package:map_engine/map_engine.dart';
import 'package:riverpod/riverpod.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/mode/map_mode.dart';
import 'package:vamos_cartographie/map/mode/mode_scope.dart';

@Dependencies([])
final class AppModeMachine with ModeMachine<AppMode> {
  AppModeMachine(this._ref);
  final Ref _ref;

  @override
  AppModeState get state => _ref.read(modeStateProvider);

  @override
  void setState(AppModeState next) {
    if (_ref.mounted) _ref.read(modeStateProvider.notifier).set(next);
  }

  final _queue = EffectQueue();

  @override
  EffectQueue get effectQueue => _queue;

  @override
  HandlerRegistry get registry => handlerRegistry(_ref);
}
