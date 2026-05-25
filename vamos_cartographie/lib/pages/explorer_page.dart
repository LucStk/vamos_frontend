import 'package:flutter/material.dart';
import 'package:vamos_cartographie/core/failure.dart';
import 'package:vamos_cartographie/core/injection.dart';
import 'package:vamos_cartographie/pages/map_page.dart';
import 'package:vamos_cartographie/data/repositories/i_trip_repository.dart';
import 'package:vamos_cartographie/domain/domain.dart';
import 'package:vamos_cartographie/widgets/trip/trip.dart';
import "package:vamos_cartographie/widgets/explorer/explorer_empty_view.dart";

import "package:vamos_cartographie/widgets/explorer/explorer_error_view.dart";

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
    TripViewerDialog.show(
      context: context,
      tripData: trip,
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

  String _parseErrorMessage(Object? error) {
    if (error is ConnectionFailure) {
      return 'Impossible de joindre le serveur.\nVérifiez votre connexion.';
    }
    if (error is ServerFailure) {
      return error.message;
    }
    return 'Une erreur est survenue.';
  }

  @override
  Widget build(BuildContext context) {
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
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return ExplorerErrorView(
              message: _parseErrorMessage(snapshot.error),
              onRetry: _refresh,
            );
          }

          final trips = snapshot.data ?? [];
          if (trips.isEmpty) {
            return const ExplorerEmptyView();
          }

          return ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            itemCount: trips.length,
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              return TripCard(
                trip: trips[index],
                onTap: () => _openTrip(trips[index]),
                onDelete: () => _deleteTrip(trips[index]),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _createTrip,
        icon: const Icon(Icons.add),
        label: const Text('Nouveau voyage'),
        tooltip: 'Créer un nouveau voyage',
      ),
    );
  }
}
