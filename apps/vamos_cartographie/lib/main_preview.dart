import 'package:device_preview/device_preview.dart';
import 'package:vamos_cartographie/bootstrap.dart';
import 'package:vamos_cartographie/dev/dev_root.dart';

/// Point d'entrée PC avec aperçu smartphone (F2 pour basculer) :
/// flutter run -d linux -t lib/main_preview.dart
void main() => runVamos(
  preInit: DevicePreview.enable,
  wrap: (app) => DevRoot(app: app),
);
