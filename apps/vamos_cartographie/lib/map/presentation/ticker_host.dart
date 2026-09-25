import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/map/map.dart';
import 'package:riverpod_annotation/experimental/scope.dart';

@Dependencies([mapContext])
class TickerHost extends StatefulWidget {
  const TickerHost({super.key, required this.child});
  final Widget child;

  @override
  State<TickerHost> createState() => _TickerHostState();
}

class _TickerHostState extends State<TickerHost> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // container.read si tu n'as pas de ref ici, ou via un ProviderScope parent
      ProviderScope.containerOf(
        context,
        listen: false,
      ).read(mapContextProvider).camera.attachAnimatedController(this);
    });
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
