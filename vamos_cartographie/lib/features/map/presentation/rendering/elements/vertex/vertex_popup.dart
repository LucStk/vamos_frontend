import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vamos_cartographie/features/topology/domain/domain.dart';
import 'package:vamos_cartographie/vamos_cartographie.dart';

class VertexPopUp extends AbstractPopUp {
  final Id<Vertex> vertexId;
  const VertexPopUp({super.key, required super.tripId, required this.vertexId});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopUpShell(buttonsBuilder: (ctx) => []);
  }
}
