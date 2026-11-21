import 'package:flutter/material.dart';

/// Demande de confirmation avant une action (souvent destructive).
class ToolConfirmation {
  const ToolConfirmation({
    required this.title,
    this.message,
    this.confirmLabel = 'Confirmer',
  });

  final String title;
  final String? message;
  final String confirmLabel;
}

/// Une action du panneau.
class ToolAction {
  const ToolAction({
    required this.icon,
    required this.label,
    required this.onPressed,
    this.destructive = false,
    this.error = false,
    this.confirmation,
  });

  final IconData icon;
  final String label;

  /// Null : action désactivée.
  final VoidCallback? onPressed;

  /// Action qui détruit quelque chose (effacer, supprimer) : couleur d'erreur.
  final bool destructive;

  /// État d'échec à signaler (ex. « Réessayer » après un routage raté).
  final bool error;

  /// Si non null, un dialogue demande confirmation avant [onPressed].
  final ToolConfirmation? confirmation;
}

/// Panneau d'actions d'un outil de la boîte à outils.
///
/// Ligne 1 : réglages de l'outil à gauche ([settings], ex. menu de mobilité),
/// actions secondaires en icônes à droite ([trailing], ex. effacer).
/// Ligne 2 : action d'appoint ([secondary], tonale) puis action principale
/// ([primary], pleine, plus large).
///
/// Chaque ligne n'apparaît que si elle a du contenu. Ni cadre ni bouton
/// retour : `Toolbox` les fournit.
class ToolPanel extends StatelessWidget {
  const ToolPanel({
    super.key,
    this.hint,
    this.settings = const [],
    this.trailing = const [],
    this.secondary,
    this.primary,
  });

  /// Consigne affichée en haut (ex. « Touchez la carte pour… »). Null : rien.
  final String? hint;

  final List<Widget> settings;
  final List<ToolAction> trailing;
  final ToolAction? secondary;
  final ToolAction? primary;

  @override
  Widget build(BuildContext context) {
    final hasTools = settings.isNotEmpty || trailing.isNotEmpty;
    final secondary = this.secondary;
    final primary = this.primary;

    final hasMain = secondary != null || primary != null;
    final hint = this.hint;
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (hint != null)
          Padding(
            padding: EdgeInsets.only(bottom: hasTools || hasMain ? 8 : 0),
            child: Text(
              hint,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        if (hasTools)
          Row(
            children: [
              ...settings,
              const Spacer(),
              for (final a in trailing) _IconAction(a),
            ],
          ),
        if (hasTools && hasMain) const SizedBox(height: 8),
        if (hasMain)
          Row(
            children: [
              if (secondary != null)
                Expanded(flex: 2, child: _MainAction(secondary, filled: false)),
              if (secondary != null && primary != null)
                const SizedBox(width: 8),
              if (primary != null)
                Expanded(flex: 3, child: _MainAction(primary, filled: true)),
            ],
          ),
      ],
    );
  }
}

/// Lance l'action, après confirmation si elle en demande une.
Future<void> _run(BuildContext context, ToolAction action) async {
  final onPressed = action.onPressed;
  if (onPressed == null) return;

  final c = action.confirmation;
  if (c == null) {
    onPressed();
    return;
  }

  final confirmed = await showDialog<bool>(
    context: context,
    builder: (dialogContext) {
      final colors = Theme.of(dialogContext).colorScheme;
      return AlertDialog(
        icon: action.destructive
            ? Icon(action.icon, color: colors.error)
            : Icon(action.icon),
        title: Text(c.title),
        content: c.message == null ? null : Text(c.message!),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(false),
            child: const Text('Annuler'),
          ),
          FilledButton(
            style: action.destructive
                ? FilledButton.styleFrom(
                    backgroundColor: colors.error,
                    foregroundColor: colors.onError,
                  )
                : null,
            onPressed: () => Navigator.of(dialogContext).pop(true),
            child: Text(c.confirmLabel),
          ),
        ],
      );
    },
  );

  if (confirmed == true && context.mounted) onPressed();
}

VoidCallback? _handler(BuildContext context, ToolAction a) =>
    a.onPressed == null ? null : () => _run(context, a);

class _IconAction extends StatelessWidget {
  const _IconAction(this.action);
  final ToolAction action;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return IconButton(
      tooltip: action.label,
      onPressed: _handler(context, action),
      color: action.destructive || action.error ? colors.error : null,
      icon: Icon(action.icon),
    );
  }
}

class _MainAction extends StatelessWidget {
  const _MainAction(this.action, {required this.filled});
  final ToolAction action;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final label = Text(
      action.label,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
    final icon = Icon(action.icon);
    final onPressed = _handler(context, action);

    // Échec ou destruction : conteneur d'erreur, quelle que soit l'emphase.
    final style = action.error || action.destructive
        ? FilledButton.styleFrom(
            backgroundColor: colors.errorContainer,
            foregroundColor: colors.onErrorContainer,
          )
        : null;

    return filled
        ? FilledButton.icon(
            onPressed: onPressed,
            style: style,
            icon: icon,
            label: label,
          )
        : FilledButton.tonalIcon(
            onPressed: onPressed,
            style: style,
            icon: icon,
            label: label,
          );
  }
}
