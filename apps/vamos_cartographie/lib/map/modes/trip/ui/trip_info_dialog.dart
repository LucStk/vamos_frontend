import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:map_engine/map_engine.dart';
import 'package:vamos_cartographie/domain_features/trip/injection/trip_store.dart';
import 'package:vamos_cartographie/map/entities/trip/sheet_pages/trip_sheet_pages.dart';
import 'package:vamos_cartographie/map/modes/trip/ui/trip_ready_dock.dart';
import 'package:vamos_cartographie/map/modes/trip/ui/widgets/header/trip_header.dart';
import 'package:vamos_cartographie/map/ui/chrome/sheets/sheet_metrics.dart';

/// La fiche du voyage, en dialog : posée juste au-dessus du dock, dont le
/// bouton « informations » est devenu la croix qui la ferme.
///
/// Elle ne se glisse pas : ses onglets (aperçu, statistiques) montrent
/// directement leur contenu complet, qui défile si l'écran est trop petit.
class TripInfoDialog extends ConsumerStatefulWidget {
  const TripInfoDialog({super.key, required this.mode});

  final TripReadyMode mode;

  @override
  ConsumerState<TripInfoDialog> createState() => _TripInfoDialogState();
}

class _TripInfoDialogState extends ConsumerState<TripInfoDialog> {
  int _tab = 0;

  @override
  Widget build(BuildContext context) {
    final trip = ref.watch(tripRequiredProvider(widget.mode.tripId));
    final pages = tripSheetPages(trip, editable: !widget.mode.readOnly);
    final tab = _tab.clamp(0, pages.length - 1);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, TripReadyDock.clearance),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: kSheetMaxWidth),
            // Toute la place disponible dès le départ : le dialog garde la
            // même taille quel que soit l'onglet.
            child: SizedBox.expand(
              // Surgit du bouton, en bas au milieu.
              child: TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: 1),
                duration: const Duration(milliseconds: 180),
                curve: Curves.easeOutCubic,
                builder: (context, t, child) => Opacity(
                  opacity: t,
                  child: Transform.scale(
                    scale: 0.92 + 0.08 * t,
                    alignment: Alignment.bottomCenter,
                    child: child,
                  ),
                ),
                child: Material(
                  elevation: kSheetElevation,
                  borderRadius: BorderRadius.circular(20),
                  clipBehavior: Clip.antiAlias,
                  color: Theme.of(context).colorScheme.surface,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Le titre du voyage, modifiable par son propriétaire.
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 12, 8, 0),
                        child: TripHeader(
                          title: trip.title,
                          canEdit: !widget.mode.readOnly,
                          onRename: (title) async {
                            ref
                                .read(tripStoreProvider.notifier)
                                .updateTrip(trip.copyWith(title: title));
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(12, 8, 12, 0),
                        child: SegmentedButton<int>(
                          showSelectedIcon: false,
                          segments: [
                            for (final (i, page) in pages.indexed)
                              ButtonSegment(
                                value: i,
                                icon: Icon(
                                  i == tab
                                      ? page.selectedIcon ?? page.icon
                                      : page.icon,
                                ),
                                label: Text(page.label),
                              ),
                          ],
                          selected: {tab},
                          onSelectionChanged: (s) =>
                              setState(() => _tab = s.first),
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.all(16),
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 200),
                            layoutBuilder: (current, previous) => Stack(
                              alignment: Alignment.topCenter,
                              children: [...previous, ?current],
                            ),
                            child: KeyedSubtree(
                              key: ValueKey(tab),
                              child:
                                  pages[tab].expanded ??
                                  pages[tab].compact.child,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
