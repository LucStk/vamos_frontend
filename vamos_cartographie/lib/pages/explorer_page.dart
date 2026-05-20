import 'package:flutter/material.dart';
import 'package:vamos_cartographie/core/failure.dart';
import 'package:vamos_cartographie/core/injection.dart';
import 'package:vamos_cartographie/pages/map_page.dart';
import 'package:vamos_cartographie/data/repositories/i_trip_repository.dart';
import 'package:vamos_cartographie/domain/domain.dart';
import 'package:vamos_cartographie/widgets/trip_info/trip_preview_dialog.dart';
import 'package:vamos_cartographie/widgets/trip_info/editor/trip_creator_dialog.dart';
import 'package:vamos_cartographie/widgets/trip_info/trip_info_dialog.dart';

class ExplorerPage extends StatefulWidget {
  const ExplorerPage({super.key});

  @override
  State<ExplorerPage> createState() => _ExplorerPageState();
}

class _ExplorerPageState extends State<ExplorerPage> {
  late Future<List<Trip>> _tripsFuture;

  @override
  void initState() {
    super.initState();
    _loadTrips();
  }

  void _loadTrips() {
    _tripsFuture = getIt<ITripRepository>().getAllTrips().then((result) {
      return result.fold((failure) => throw failure, (trips) => trips);
    });
  }

  void _refresh() {
    setState(() {
      _loadTrips();
    });
  }

  void _openTrip(Trip trip) {
    print("test opentrip $trip");
    TripPreviewDialog.show(
      context: context,
      tripData: trip,
      onEdit: () => TripInfoDialog.showEditorForExistingTrip(
        context: context,
        tripId: trip.id!,
        onSaved: _refresh,
      ),
      onExplore: () async {
        await Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (_) => MapPage(tripId: trip.id)));
        _refresh();
      },
    );
  }

  void _createTrip() {
    TripCreatorDialog.show(
      context: context,
      onCreated: (id) async {
        await Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (_) => MapPage(tripId: id)));
        _refresh();
      },
    );
  }

  Future<void> _deleteTrip(Trip trip) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Supprimer le voyage'),
        content: Text(
          'Voulez-vous vraiment supprimer « ${trip.title.isEmpty ? 'Sans titre' : trip.title} » ?\nCette action est irréversible.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Annuler'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () => Navigator.of(ctx).pop(true),
            child: const Text('Supprimer'),
          ),
        ],
      ),
    );

    if (confirmed != true) return;

    final result = await getIt<ITripRepository>().deleteTrip(trip.id!);

    if (!mounted) return;

    result.fold(
      (failure) => _showSnackBar(
        message: 'Erreur : ${_failureMessage(failure)}',
        isError: true,
      ),
      (_) {
        _showSnackBar(message: 'Voyage supprimé.', isError: false);
        _refresh();
      },
    );
  }

  String _failureMessage(Failure failure) {
    if (failure is ServerFailure) return failure.message;
    if (failure is ConnectionFailure) return 'Impossible de joindre le serveur';
    if (failure is NotFoundFailure) return 'Voyage introuvable';
    return failure.toString();
  }

  void _showSnackBar({required String message, required bool isError}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isError ? Colors.redAccent : Colors.green.shade600,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  // ── Build ─────────────────────────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes voyages'),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Actualiser',
            onPressed: _refresh,
          ),
        ],
      ),
      body: FutureBuilder<List<Trip>>(
        future: _tripsFuture,
        builder: (context, snapshot) {
          // ── Chargement ──
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // ── Erreur ──
          if (snapshot.hasError) {
            final err = snapshot.error;
            String message = 'Une erreur est survenue.';
            if (err is ConnectionFailure) {
              message =
                  'Impossible de joindre le serveur.\nVérifiez votre connexion.';
            } else if (err is ServerFailure) {
              message = err.message;
            }
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.cloud_off,
                      size: 64,
                      color: theme.colorScheme.error,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      message,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 24),
                    FilledButton.icon(
                      onPressed: _refresh,
                      icon: const Icon(Icons.refresh),
                      label: const Text('Réessayer'),
                    ),
                  ],
                ),
              ),
            );
          }

          final trips = snapshot.data ?? [];

          // ── Liste vide ──
          if (trips.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.map_outlined,
                      size: 72,
                      color: theme.colorScheme.primary.withOpacity(0.4),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Aucun voyage pour l\'instant',
                      style: theme.textTheme.titleMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Appuyez sur + pour créer votre premier voyage.',
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          // ── Liste ──
          return ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            itemCount: trips.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final trip = trips[index];
              return _TripCard(
                trip: trip,
                onTap: () => _openTrip(trip),
                onDelete: () => _deleteTrip(trip),
              );
            },
          );
        },
      ),

      // ── FAB ──
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _createTrip,
        icon: const Icon(Icons.add),
        label: const Text('Nouveau voyage'),
        tooltip: 'Créer un nouveau voyage',
      ),
    );
  }
}

// ── Card ─────────────────────────────────────────────────────────────────────

class _TripCard extends StatelessWidget {
  final Trip trip;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const _TripCard({
    required this.trip,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final title = trip.title.trim().isEmpty ? 'Sans titre' : trip.title.trim();
    final hasDate = trip.date != null;
    final dateStr = trip.date?.toIso8601String().substring(0, 10);
    final hasDescription = trip.description.trim().isNotEmpty;

    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 14, 4, 14),
          child: Row(
            children: [
              // Icône
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.route,
                  color: theme.colorScheme.onPrimaryContainer,
                ),
              ),
              const SizedBox(width: 14),

              // Texte
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (hasDate) ...[
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            size: 12,
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            dateStr!,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ],
                    if (hasDescription) ...[
                      const SizedBox(height: 4),
                      Text(
                        trip.description.trim(),
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
              ),

              // Actions
              IconButton(
                icon: const Icon(Icons.delete_outline),
                tooltip: 'Supprimer',
                color: Colors.redAccent,
                onPressed: onDelete,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
