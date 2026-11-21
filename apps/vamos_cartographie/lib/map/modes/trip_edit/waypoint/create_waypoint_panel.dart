import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/engine/mode_machine.dart';
import 'package:vamos_cartographie/map/ui/chrome/toolbox/tool_panel.dart';

@Dependencies([modeSelection, ModeMachine])
class CreateWaypointPanel extends ConsumerWidget {
  const CreateWaypointPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pending = ref.watch(modeSlotProvider(pendingWaypointSlot));

    return ToolPanel(
      primary: ToolAction(
        icon: Icons.cancel,
        label: "Cancel",
        onPressed: () {},
      ),
      secondary: ToolAction(
        icon: Icons.task_alt,
        label: "Validate",
        onPressed: () {},
      ),
    );
  }
}
