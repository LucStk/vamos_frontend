import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';

import 'package:riverpod_annotation/experimental/scope.dart';
import 'package:vamos_cartographie/domain_features/trip/injection/trip_store.dart';
import 'package:vamos_cartographie/domain_features/user_profile/user_profile.dart';
import 'package:vamos_cartographie/map/interaction/mode_machine.dart';
import 'package:vamos_cartographie/map/modes/shared/ui/trip/header/trip_header.dart';
import 'package:vamos_cartographie/map/modes/shared/ui/trip/sheet/trip_compact_content.dart';
import 'package:vamos_cartographie/map/modes/shared/ui/trip/sheet/trip_viewer_content.dart';
import 'package:vamos_cartographie/map/ui/chrome/floating_header_card.dart';
import 'package:vamos_cartographie/map/ui/chrome/profile_capsule.dart';
import 'package:vamos_cartographie/map/ui/chrome/sheets/draggable_bottom_sheet_shell.dart';
import 'package:vamos_cartographie/routing/app_router.dart';
import 'package:vamos_cartographie/routing/routes/auth_routes.dart';

@Dependencies([modeSelection, ModeMachine])
class TripReadOnlyUi extends ConsumerWidget {
  const TripReadOnlyUi(this.mode, {super.key});

  final TripReadOnlyMode mode;

  static const double _barHeight = 56;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trip = ref.watch(tripRequiredProvider(mode.tripId));
    final userProfile = ref.watch(userProfileAsyncProvider(trip.ownerId));
    return Stack(
      children: [
        SafeArea(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 300),
                  child: FloatingHeaderCard(
                    profileCapsule: ProfileCapsule(
                      onTap: () =>
                          UserProfileRoute(trip.ownerId.value).go(context),

                      profil: userProfile,
                    ),
                    child: TripHeader(
                      title: trip.title,
                      canEdit: false,
                      onRename: (newTitle) async {
                        ref
                            .read(tripStoreProvider.notifier)
                            .updateTrip(trip.copyWith(title: newTitle));
                        return null;
                      },
                    ),
                  ),
                ),
              ),

              Positioned(
                top: 0,
                left: 0,
                height: _barHeight,

                child: Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () =>
                        ref.applyTransition(Transition.to(ExploreMode())),
                  ),
                ),
              ),
            ],
          ),
        ),
        // TripSelectionSheet(tripId: mode.tripId, canEdit: false),
        DraggableBottomSheetShell(
          compactContent: TripCompactContent(trip: trip, editable: false),
          expandedContent: TripViewerContent(trip: trip, editable: false),
        ),
      ],
    );
  }
}
