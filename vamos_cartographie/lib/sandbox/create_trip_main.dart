import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../core/injection.dart';
import 'package:vamos_cartographie/widgets/trip_info_sheet.dart';
import '../domain/models.dart';

void main() async {
  // Obligatoire si tu fais du async avant runApp
  WidgetsFlutterBinding.ensureInitialized();

  // On initialise GetIt
  await configureDependencies();

  Trip trip = Trip();

  runApp(
    MaterialApp(
      home: Scaffold(
        // backgroundColor: CupertinoColors.systemRed,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(100),
            child: TripInfoEditor(
              trip: trip,
              onConfirm: () {},
              onCancel: () {},
            ),
          ),
        ),
      ),
    ),
  );
}
