import 'package:flutter/material.dart';
import 'widgets/map_view.dart';
import 'widgets/map_top_bar.dart';

class MapBody extends StatelessWidget {
  const MapBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Stack(children: [MapView(), MapTopBar()]));
  }
}
