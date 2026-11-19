import 'package:flutter/material.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/map/modes/shared/menus/ui/menu_button.dart';
import 'package:vamos_cartographie/map/ui/chrome/sheets/paged_sheet/sheet_page.dart';

SheetCompact waypointCreateCompact(TripId tripId) {
  return SheetCompact(
    height: 100,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MenuButton(
          icon: Icons.add_location_alt_outlined,
          label: 'Validate',
          onPressed: () {},
        ),
      ],
    ),
  );
}
