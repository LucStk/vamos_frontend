import 'package:material_ui/material_ui.dart';

/// En-tête d'un [InfoDialog] qui n'est pas au sommet de la hiérarchie : une
/// flèche pour remonter d'un niveau (morceau → jour, waypoint → jour), un
/// éventuel élément de tête (icône, menu de catégorie), puis [child] (titre
/// et sous-titre).
///
/// Sans [onBack], pas de flèche : l'en-tête n'est alors qu'un [child] avec son
/// élément de tête.
class InfoDialogHeader extends StatelessWidget {
  const InfoDialogHeader({
    super.key,
    required this.child,
    this.onBack,
    this.backTooltip = 'Retour',
    this.leading,
  });

  final Widget child;

  /// Remonte d'un niveau ; null : pas de flèche.
  final VoidCallback? onBack;
  final String backTooltip;

  /// À gauche du titre (après la flèche).
  final Widget? leading;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      if (onBack != null)
        IconButton(
          icon: Icon(Icons.adaptive.arrow_back),
          tooltip: backTooltip,
          visualDensity: VisualDensity.compact,
          onPressed: onBack,
        ),
      if (leading != null) ...[leading!, const SizedBox(width: 10)],
      Expanded(child: child),
    ],
  );
}
