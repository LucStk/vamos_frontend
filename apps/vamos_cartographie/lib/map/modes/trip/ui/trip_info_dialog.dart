import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:vamos_cartographie/domain_features/trip/injection/trip_store.dart';
import 'package:vamos_cartographie/map/entities/trip/sheet_pages/trip_info_pages.dart';
import 'package:vamos_cartographie/map/modes/trip/ui/trip_ready_dock.dart';
import 'package:vamos_cartographie/map/modes/trip/ui/widgets/header/trip_header.dart';
import 'package:vamos_cartographie/map/ui/chrome/dialog/info_dialog.dart';

/// La fiche du voyage, en dialog : posée juste au-dessus du dock, dont le
/// bouton « informations » est devenu la croix qui la ferme.
///
/// Elle occupe tout l'écran disponible, pour garder la même taille d'un
/// onglet (aperçu, statistiques) à l'autre ; leur contenu défile si besoin.
class TripInfoDialog extends ConsumerWidget {
  const TripInfoDialog({super.key, required this.mode});

  final TripReadyMode mode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trip = ref.watch(tripRequiredProvider(mode.tripId));

    return InfoDialog(
      bottomInset: TripReadyDock.clearance,
      // Le titre du voyage, modifiable par son propriétaire.
      header: TripHeader(
        title: trip.title,
        canEdit: !mode.readOnly,
        onRename: (title) async {
          ref
              .read(tripStoreProvider.notifier)
              .updateTrip(trip.copyWith(title: title));
          return null;
        },
      ),
      pages: tripInfoPages(trip, editable: !mode.readOnly),
    );
  }
}
