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
  var _phone = false;

  @override
  void initState() {
    super.initState();
    if (const bool.fromEnvironment('PHONE')) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _toggle());
    }
  }

  Future<void> _toggle() async {
    debugPrint('F2 reçu');
    final c = DevicePreview.maybeController;
    if (c == null) {
      debugPrint('DevicePreview.maybeController == null → simulation inactive');
      return;
    }
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
