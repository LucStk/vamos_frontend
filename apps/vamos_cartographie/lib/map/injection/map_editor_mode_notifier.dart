import 'package:domain_core/domain/collection_store.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:trip_application/trip_application.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class MapEditorModeNotifier extends Notifier<MapEditorMode>
    with ModeControllerMixin<MapEditorMode> {
  final _queue = EffectQueue();

  @override
  MapEditorMode build() {
    return IdleEditor();
  }

  @override
  MapEditorMode get mode => state;

  @override
  void setMode(MapEditorMode mode) {
    state = mode;
  }

  @override
  ModeCommandResolver<MapEditorMode> get resolver =>
      ref.read(mapCommandResolverProvide);

  @override
  EffectQueue get effectQueue => _queue;

  void handleGesture(MapGesture gesture, ScreenOffset offset) {
    send(gesture, offset);
  }
}
