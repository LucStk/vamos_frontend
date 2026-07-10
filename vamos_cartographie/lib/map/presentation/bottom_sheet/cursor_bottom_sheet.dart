// Emplacement suggéré : lib/features/waypoint/widgets/waypoint_viewer_bottom_sheet.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip/domain/domain.dart';
import 'package:vamos_cartographie/map/presentation/bottom_sheet/simple_bottom_sheet_shell.dart';

// On passe en StatefulConsumerWidget pour pouvoir stocker l'état "isAtMin"
class CursorBottomSheet extends ConsumerWidget {
  final TripId tripId;

  const CursorBottomSheet({super.key, required this.tripId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SimpleBottomSheetShell(
      content: Column(
        key: const ValueKey(
          'compact_content',
        ), // 👈 CRUCIAL pour AnimatedSwitcher
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: Text(
                "Glissez vers le haut pour voir les détails",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            ],
          ),
        ],
      ),
    );
  }
}
