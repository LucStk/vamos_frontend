import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/map/engine/engine.dart';

class MapScope extends StatefulWidget {
  const MapScope({super.key, required this.child});
  final Widget child;

  @override
  State<MapScope> createState() => _MapScopeState();
}

class _MapScopeState extends State<MapScope> {
  final _controller = MapController();

  @override
  void dispose() {
    _controller.dispose(); // les descendants sont déjà démontés à ce stade
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ProviderScope(
    overrides: [mapControllerProvider.overrideWithValue(_controller)],
    child: widget.child,
  );
}
