import 'package:map_application/map_application.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:vamos_cartographie/map/engine/domain/map_context.dart';
part 'map_context_provider.g.dart';

@Riverpod(keepAlive: true, dependencies: [])
MapContext mapContext(Ref ref) =>
    throw StateError('mapContext doit être fourni par un MapScope');

@Riverpod(keepAlive: true, dependencies: [])
BaseController<BaseMode> mapController(Ref ref) =>
    throw StateError('mapContext doit être fourni par un MapScope');
