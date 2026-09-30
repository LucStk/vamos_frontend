import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stored_file_application/stored_file_application.dart';
import 'package:trip_application/trip_application.dart';
import '/domain_features/domain_features.dart';
import '/map/features/explore_map/presentation/trip_section_label.dart';
import '/ui_kit/ui_kit.dart';

/// Ouvre le formulaire en plein écran (animation bas → haut).
/// Retourne `true` si le voyage a été sauvegardé, `false` sinon.
Future<bool> showTripFormSheet(
  BuildContext context, {
  required Trip trip,
  required String title,
}) async {
  final saved = await showModalBottomSheet<bool>(
    context: context,
    useRootNavigator: true, // recouvre aussi les overlays de la carte
    isScrollControlled: true, // autorise la hauteur maximale
    useSafeArea: true,
    isDismissible: false, // pas de fermeture par tap sur le fond
    enableDrag: false, // évite de perdre la saisie par un swipe
    clipBehavior: Clip.antiAlias,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    constraints: const BoxConstraints(maxWidth: 640),
    builder: (_) => TripFormSheet(initialTrip: trip, title: title),
  );
  return saved ?? false;
}

class TripFormSheet extends ConsumerStatefulWidget {
  const TripFormSheet({
    super.key,
    required this.initialTrip,
    required this.title,
  });

  final Trip initialTrip;
  final String title;

  @override
  ConsumerState<TripFormSheet> createState() => _TripFormSheetState();
}

class _TripFormSheetState extends ConsumerState<TripFormSheet> {
  late Trip _currentTrip;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _currentTrip = widget.initialTrip;
  }

  void _patch(Trip newTrip) => setState(() => _currentTrip = newTrip);

  void _cancel() => Navigator.of(context).pop(false);

  Future<void> _save() async {
    final navigator = Navigator.of(context);
    setState(() => _isSaving = true);

    final result = await ref
        .read(tripStoreProvider.notifier)
        .updateTrip(_currentTrip);

    if (!mounted) return;

    if (result.isRight()) {
      navigator.pop(true);
    } else {
      setState(() => _isSaving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop:
          !_isSaving, // bloque le bouton retour Android pendant la sauvegarde
      child: Scaffold(
        // Le Scaffold gère tout seul le clavier (resizeToAvoidBottomInset)
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(Icons.close),
            tooltip: 'Annuler',
            onPressed: _isSaving ? null : _cancel,
          ),
          title: Text(widget.title),
        ),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            TextFormField(
              initialValue: widget.initialTrip.title,
              onChanged: (val) => _patch(_currentTrip.copyWith(title: val)),
              textCapitalization: TextCapitalization.sentences,
              decoration: const InputDecoration(
                labelText: 'Titre du voyage',
                hintText: 'Ex : Tour de Bretagne 2025',
                prefixIcon: Icon(Icons.title),
                border: OutlineInputBorder(),
              ),
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
            const TripSectionLabel(label: 'DATE', icon: Icons.calendar_today),
            const SizedBox(height: 8),
            DatePicker(
              date: _currentTrip.date,
              onDateChanged: (d) => _patch(_currentTrip.copyWith(date: d)),
            ),
            const SizedBox(height: 20),
            const TripSectionLabel(label: 'DESCRIPTION', icon: Icons.notes),
            const SizedBox(height: 8),
            TextAreaWithCounter(
              initialValue: _currentTrip.description,
              readOnly: false,
              onChanged: (val) =>
                  _patch(_currentTrip.copyWith(description: val)),
            ),
            const SizedBox(height: 20),
            const TripSectionLabel(
              label: 'PHOTOS',
              icon: Icons.photo_library_outlined,
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerLeft,
              child: FractionallySizedBox(
                widthFactor: 0.9,
                child: ImageCarouselPicker(
                  id: widget.initialTrip.id,
                  ownerType: TargetType.trip,
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
            child: Row(
              children: [
                CancelButton(onPressed: _isSaving ? null : _cancel),
                const Spacer(),
                ConfirmButton(isLoading: _isSaving, onPressed: _save),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
