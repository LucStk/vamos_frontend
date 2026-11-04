// lib/dev/dev_root.dart
import 'package:device_preview/device_preview.dart';
import 'package:device_preview/presets.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

/// F2 : bascule entre la vraie fenêtre (format PC) et l'aperçu smartphone.
class DevRoot extends StatefulWidget {
  const DevRoot({super.key, required this.app});
  final Widget app;

  @override
  State<DevRoot> createState() => _DevRootState();
}

class _DevRootState extends State<DevRoot> {
  // Lancer avec --dart-define=PHONE=false pour démarrer en format PC
  static const _phoneByDefault = bool.fromEnvironment(
    'PHONE',
    defaultValue: true,
  );

  late var _phone = _phoneByDefault;

  @override
  void initState() {
    super.initState();

    if (_phone) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        final c = DevicePreview.maybeController;
        if (c == null) return;
        await c.applyPreset(DevicePresets.iPhone16);
      });
    }
  }

  Future<void> _toggle() async {
    final c = DevicePreview.maybeController;
    if (c == null) return;

    _phone = !_phone;

    if (_phone) {
      await c.applyPreset(DevicePresets.iPhone16);
    } else {
      await c.reset();
    }
  }

  @override
  Widget build(BuildContext context) => CallbackShortcuts(
    bindings: {const SingleActivator(LogicalKeyboardKey.f2): _toggle},
    child: Focus(autofocus: true, child: widget.app),
  );
}
