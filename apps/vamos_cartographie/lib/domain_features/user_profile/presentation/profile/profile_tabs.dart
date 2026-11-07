import 'package:flutter/material.dart';

enum ProfileTab {
  trips('Voyages'),
  favorites('Favoris'),
  following('Abonnements'),
  followers('Abonnés');

  const ProfileTab(this.label);

  final String label;
}

/// Onglets du profil.
///
/// On n'utilise volontairement pas `TabBarView` : il exige une hauteur bornée
/// et pose problème dans une page qui scrolle. Ici, seul le contenu de
/// l'onglet sélectionné est construit (donc ses providers ne sont lus qu'à
/// ce moment-là).
///
/// La liste `tabs` doit rester stable pour une même instance du widget.
class ProfileTabs extends StatefulWidget {
  const ProfileTabs({
    super.key,
    required this.tabs,
    required this.contentBuilder,
  }) : assert(tabs.length > 0);

  final List<ProfileTab> tabs;
  final Widget Function(BuildContext context, ProfileTab tab) contentBuilder;

  @override
  State<ProfileTabs> createState() => _ProfileTabsState();
}

class _ProfileTabsState extends State<ProfileTabs>
    with SingleTickerProviderStateMixin {
  late final TabController _controller;
  int _index = 0;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: widget.tabs.length, vsync: this)
      ..addListener(_onTabChanged);
  }

  void _onTabChanged() {
    if (_controller.index != _index) {
      setState(() => _index = _controller.index);
    }
  }

  @override
  void dispose() {
    _controller
      ..removeListener(_onTabChanged)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tab = widget.tabs[_index];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TabBar(
          controller: _controller,
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          tabs: [for (final t in widget.tabs) Tab(text: t.label)],
        ),
        const SizedBox(height: 16),
        KeyedSubtree(
          key: ValueKey(tab),
          child: widget.contentBuilder(context, tab),
        ),
      ],
    );
  }
}
