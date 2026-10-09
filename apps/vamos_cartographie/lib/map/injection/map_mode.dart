import 'package:map_engine/map_engine.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_mode.g.dart';

@Riverpod(keepAlive: true, dependencies: [])
Mode mapMode(Ref ref) => throw UnimplementedError();

@Riverpod(keepAlive: true, dependencies: [])
Overlay? modeDecorator(Ref ref) => throw UnimplementedError();

@Riverpod(keepAlive: true, dependencies: [])
ModeContext modeContext(Ref ref) => throw UnimplementedError();

@Riverpod(keepAlive: true, dependencies: [])
ModeHost mapModeController(Ref ref) => throw UnimplementedError();
