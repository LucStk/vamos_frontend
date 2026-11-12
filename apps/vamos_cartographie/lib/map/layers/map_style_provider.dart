import 'package:flutter_map_vector_tiles/flutter_map_vector_tiles.dart' as vt;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_style_provider.g.dart';

@riverpod
Future<vt.Style> mapStyle(Ref ref) async {
  final style = await vt.StyleReader(
    uri: 'asset://assets/map/styles/vamos.json',
    logger: const vt.Logger.console(),
  ).read();

  ref.onDispose(style.dispose);

  return style;
}
