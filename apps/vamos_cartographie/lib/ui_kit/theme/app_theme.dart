import 'package:material_ui/material_ui.dart';
import 'package:vamos_cartographie/ui_kit/theme/app_colors.dart';
import 'package:vamos_cartographie/ui_kit/theme/app_tokens.dart';

const _borderM = BorderRadius.all(Radius.circular(AppTokens.radiusM));
const _borderL = BorderRadius.all(Radius.circular(AppTokens.radiusL));
const _borderSheet = BorderRadius.vertical(
  top: Radius.circular(AppTokens.radiusSheet),
);

/// Thème global de Vamos : couleurs, police et style par défaut des widgets
/// Material (champs, cartes, dialogues, feuilles, barre de navigation…).
///
/// Les widgets de l'app ne codent ni couleur, ni police, ni rayon en dur :
/// ils lisent `Theme.of(context)` et héritent de ce qui est défini ici.
///
/// Boutons : on garde le style Material 3 par défaut (couleurs du schéma,
/// police du thème). Pour changer leur forme ou leur taille, ajouter
/// `filledButtonTheme`, `outlinedButtonTheme`… dans [_build].
abstract final class AppTheme {
  static ThemeData light() => _build(Brightness.light);
  static ThemeData dark() => _build(Brightness.dark);

  /// Palette complète : `primary` vient de [AppTokens.seed] ; `secondary` et
  /// `tertiary` viennent de leur propre graine si elle est définie, sinon
  /// de la même palette. Erreur, surfaces et contours restent ceux de Material.
  ///
  /// Pour imposer une teinte exacte (charte graphique) plutôt qu'une graine,
  /// ajouter un `.copyWith(primary: …, onPrimary: …)` sur le résultat, en
  /// pensant à la variante sombre.
  static ColorScheme _colorScheme(Brightness brightness) {
    var scheme = ColorScheme.fromSeed(
      seedColor: AppTokens.seed,
      brightness: brightness,
    );

    final secondarySeed = AppTokens.secondarySeed;
    if (secondarySeed != null) {
      final s = ColorScheme.fromSeed(
        seedColor: secondarySeed,
        brightness: brightness,
      );
      scheme = scheme.copyWith(
        secondary: s.primary,
        onSecondary: s.onPrimary,
        secondaryContainer: s.primaryContainer,
        onSecondaryContainer: s.onPrimaryContainer,
      );
    }

    final tertiarySeed = AppTokens.tertiarySeed;
    if (tertiarySeed != null) {
      final t = ColorScheme.fromSeed(
        seedColor: tertiarySeed,
        brightness: brightness,
      );
      scheme = scheme.copyWith(
        tertiary: t.primary,
        onTertiary: t.onPrimary,
        tertiaryContainer: t.primaryContainer,
        onTertiaryContainer: t.onPrimaryContainer,
      );
    }

    return scheme;
  }

  static ThemeData _build(Brightness brightness) {
    final scheme = _colorScheme(brightness);

    // Thème de départ : applique la police à toute l'échelle typographique
    // (titres, corps, libellés). Les `TextStyle(fontSize: …)` écrits en dur
    // dans les widgets en héritent aussi.
    final base = ThemeData(
      colorScheme: scheme,
      fontFamily: AppTokens.fontFamily,
    );
    final text = base.textTheme;

    return base.copyWith(
      extensions: [
        brightness == Brightness.dark ? AppColors.dark : AppColors.light,
      ],

      appBarTheme: AppBarTheme(
        backgroundColor: scheme.surface,
        foregroundColor: scheme.onSurface,
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 1,
        centerTitle: false,
        titleTextStyle: text.titleLarge,
      ),

      // Tous les TextField / TextFormField : contour arrondi, couleurs
      // (repos, focus, erreur) fournies par le schéma. Un `border:` écrit
      // dans un widget remplace celui-ci : le retirer pour hériter du thème.
      inputDecorationTheme: const InputDecorationThemeData(
        border: OutlineInputBorder(borderRadius: _borderM),
      ),

      cardTheme: CardThemeData(
        elevation: 0,
        color: scheme.surfaceContainerLow,
        shape: RoundedRectangleBorder(
          borderRadius: _borderL,
          side: BorderSide(color: scheme.outlineVariant),
        ),
      ),

      dialogTheme: const DialogThemeData(
        shape: RoundedRectangleBorder(borderRadius: _borderL),
      ),

      bottomSheetTheme: const BottomSheetThemeData(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: _borderSheet),
      ),

      navigationBarTheme: NavigationBarThemeData(
        indicatorColor: scheme.primaryContainer,
        iconTheme: WidgetStateProperty.resolveWith(
          (states) => IconThemeData(
            color: states.contains(WidgetState.selected)
                ? scheme.onPrimaryContainer
                : scheme.onSurfaceVariant,
          ),
        ),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return text.labelMedium?.copyWith(
            fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
            color: selected ? scheme.onSurface : scheme.onSurfaceVariant,
          );
        }),
      ),

      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: _borderM),
      ),
    );
  }
}
