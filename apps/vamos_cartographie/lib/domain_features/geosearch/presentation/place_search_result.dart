import 'package:flutter/material.dart';
import 'package:vamos_cartographie/domain_features/geosearch/domain/place_result.dart';
import 'package:vamos_cartographie/domain_features/geosearch/injection/place_search_notifier.dart';

class Results extends StatelessWidget {
  const Results({super.key, required this.state, required this.onSelected});

  final PlaceSearchState state;
  final ValueChanged<PlaceResult> onSelected;

  @override
  Widget build(BuildContext context) {
    if (state.status == PlaceSearchStatus.idle) {
      return const SizedBox.shrink();
    }

    final theme = Theme.of(context);
    final response = state.response;

    Widget body;
    if (state.status == PlaceSearchStatus.error) {
      body = ListTile(
        leading: Icon(Icons.error_outline, color: theme.colorScheme.error),
        title: Text(state.errorMessage ?? 'Recherche indisponible.'),
      );
    } else if (state.status == PlaceSearchStatus.data &&
        response.results.isEmpty) {
      body = const ListTile(title: Text('Aucun résultat'));
    } else {
      body = ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: response.results.length,
        separatorBuilder: (_, _) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final place = response.results[index];
          return ListTile(
            leading: Icon(
              response.isCategory ? Icons.place : Icons.location_on_outlined,
            ),
            title: Text(
              place.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: place.subtitle.isEmpty
                ? null
                : Text(
                    place.subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
            trailing: place.distanceM == null
                ? null
                : Text(_formatDistance(place.distanceM!)),
            onTap: () => onSelected(place),
          );
        },
      );
    }

    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(16),
        clipBehavior: Clip.antiAlias,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 320),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (state.status == PlaceSearchStatus.loading)
                const LinearProgressIndicator(minHeight: 2),
              if (response.isCategory && response.category != null)
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
                  child: Text(
                    '${response.category!.label} autour de vous',
                    style: theme.textTheme.labelLarge,
                  ),
                ),
              Flexible(child: body),
            ],
          ),
        ),
      ),
    );
  }
}

String _formatDistance(int meters) =>
    meters < 1000 ? '$meters m' : '${(meters / 1000).toStringAsFixed(1)} km';
