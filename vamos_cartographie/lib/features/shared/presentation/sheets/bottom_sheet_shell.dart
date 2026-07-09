// Emplacement suggéré : à côté de dialog_shell.dart
// (ex: lib/features/shared/widgets/.../bottom_sheet_shell.dart)
// Pense à l'exporter depuis shared.dart, comme DialogShell.

import 'package:flutter/material.dart';

/// Shell générique pour présenter du contenu dans une modal BottomSheet.
///
/// Pensé pour être visuellement cohérent avec [DialogShell] (même pattern
/// de content scrollable + rangée de boutons en bas), tout en étant
/// agréable :
/// - sur mobile : prend la largeur de l'écran, hauteur adaptative,
///   drag handle + swipe-to-dismiss.
/// - sur desktop/tablette : largeur plafonnée et centrée (via
///   `constraints` de [showModalBottomSheet]), pour éviter une sheet
///   qui s'étire sur toute la largeur d'un grand écran.
///
/// Usage direct (dans un widget qui a déjà tout ce qu'il faut, comme
/// WaypointViewerDialog le fait avec DialogShell) :
///
/// ```dart
/// showModalBottomSheet(
///   context: context,
///   isScrollControlled: true,
///   useSafeArea: true,
///   backgroundColor: Colors.transparent,
///   constraints: const BoxConstraints(maxWidth: 560),
///   builder: (_) => BottomSheetShell(
///     content: MyContent(),
///     buttonsBuilder: (ctx) => [...],
///   ),
/// );
/// ```
///
/// Ou via le raccourci [BottomSheetShell.show], qui encapsule toute
/// cette configuration (isScrollControlled, useSafeArea, contraintes de
/// largeur, fond transparent) :
///
/// ```dart
/// BottomSheetShell.show(
///   context: context,
///   content: MyContent(),
///   buttonsBuilder: (ctx) => [...],
/// );
/// ```
class BottomSheetShell extends StatelessWidget {
  final Widget content;

  /// Même signature que DialogShell.buttonsBuilder : un builder qui reçoit
  /// le BuildContext de la sheet et retourne la liste de boutons à afficher
  /// en bas. Ça permet de réutiliser exactement le même buttonsBuilder
  /// pour un DialogShell et pour un BottomSheetShell.
  final List<Widget> Function(BuildContext sheetContext)? buttonsBuilder;

  /// Largeur maximale de la sheet. Sur mobile (largeur d'écran < maxWidth)
  /// ça n'a aucun effet visible : la sheet prend simplement toute la
  /// largeur disponible. Sur desktop, ça la recentre en "panneau" ancré
  /// en bas plutôt que de l'étirer sur tout l'écran.
  final double maxWidth;

  /// Fraction de la hauteur d'écran que la sheet peut occuper au maximum.
  final double maxHeightFactor;

  final bool showDragHandle;
  final VoidCallback? onClose;

  const BottomSheetShell({
    super.key,
    required this.content,
    this.buttonsBuilder,
    this.maxWidth = 560,
    this.maxHeightFactor = 0.9,
    this.showDragHandle = true,
    this.onClose,
  });

  /// Ouvre ce shell dans une modal bottom sheet, avec toute la
  /// configuration nécessaire pour un bon rendu mobile ET desktop déjà
  /// en place (isScrollControlled, useSafeArea, fond transparent,
  /// contrainte de largeur).
  static Future<T?> show<T>({
    required BuildContext context,
    required Widget content,
    List<Widget> Function(BuildContext sheetContext)? buttonsBuilder,
    double maxWidth = 560,
    double maxHeightFactor = 0.9,
    bool showDragHandle = true,
    VoidCallback? onClose,
    bool isDismissible = true,
    bool enableDrag = true,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      backgroundColor: Colors.transparent,
      constraints: BoxConstraints(maxWidth: maxWidth),
      builder: (sheetContext) => BottomSheetShell(
        content: content,
        buttonsBuilder: buttonsBuilder,
        maxWidth: maxWidth,
        maxHeightFactor: maxHeightFactor,
        showDragHandle: showDragHandle,
        onClose: onClose,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    final maxHeight = screenHeight * maxHeightFactor;

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: maxHeight),
      child: Material(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        clipBehavior: Clip.antiAlias,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Barre du haut : drag handle centré + bouton fermer, comme
            // le petit "X" en haut à droite du DialogShell.
            SizedBox(
              height: 40,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  if (showDragHandle)
                    Container(
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Theme.of(context).dividerColor,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  Positioned(
                    right: 4,
                    child: IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: onClose ?? () => Navigator.of(context).pop(),
                      splashRadius: 20,
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: content,
              ),
            ),
            if (buttonsBuilder != null) ...[
              const Divider(height: 1),
              // SafeArea côté bas pour ne pas coller à la home indicator
              // (iPhone) ou à la barre de navigation Android.
              SafeArea(
                top: false,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: buttonsBuilder!(context),
                  ),
                ),
              ),
            ] else
              const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
