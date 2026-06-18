import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:vamos_cartographie/features/map/presentation/popups/popup_shell.dart';
import 'package:vamos_cartographie/features/map/presentation/popups/popup_abstract.dart';

class CursorPopUp extends AbstractPopUp {
  final LatLng latLng;
  const CursorPopUp({super.key, required super.tripId, required this.latLng});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopUpShell(buttonsBuilder: (ctx) => []);
  }
}
