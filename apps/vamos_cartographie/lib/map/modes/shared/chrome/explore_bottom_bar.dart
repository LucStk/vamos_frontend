import 'package:flutter/material.dart';

class ExploreBottomBar extends StatelessWidget {
  const ExploreBottomBar({
    super.key,
    required this.selectedIndex,
    required this.onSelected,
  });

  final int selectedIndex;
  final ValueChanged<int> onSelected;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Material(
      color: scheme.surface,
      elevation: 8,
      shadowColor: Colors.black54,
      borderRadius: BorderRadius.circular(28),
      clipBehavior: Clip.antiAlias,
      child: NavigationBar(
        height: 64,
        elevation: 0,
        backgroundColor: Colors.transparent,
        selectedIndex: selectedIndex,
        onDestinationSelected: onSelected,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.map_outlined),
            selectedIcon: Icon(Icons.map),
            label: 'Carte',
          ),
          NavigationDestination(icon: Icon(Icons.search), label: 'Recherche'),
          NavigationDestination(
            icon: Icon(Icons.bookmark_border),
            selectedIcon: Icon(Icons.bookmark),
            label: 'Favoris',
          ),
        ],
      ),
    );
  }
}
