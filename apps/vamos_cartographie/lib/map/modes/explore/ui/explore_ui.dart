import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/map/interaction/mode_machine.dart';
import 'package:vamos_cartographie/map/ui/chrome/account_button.dart';

@Dependencies([modeSelection, ModeMachine])
class ExploreUi extends ConsumerWidget {
  const ExploreUi(this.mode, {super.key});

  final ExploreMode mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        SafeArea(
          child: Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: AccountButton(),
            ),
          ),
        ),
      ],
    );
  }
}
