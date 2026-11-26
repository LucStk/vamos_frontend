// app_services/connectivity/presentation/backend_health_banner.dart
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vamos_cartographie/core/network/backend_health.dart';

/// Pose [BackendOfflineBadge] par-dessus [child], sans rien intercepter :
/// seul le badge reçoit les touches, le reste passe à la carte.
///
/// Branché dans `app.dart`, donc visible au-dessus de la carte comme des pages.
class BackendHealthBanner extends StatelessWidget {
  const BackendHealthBanner({
    super.key,
    required this.child,
    this.alignment = Alignment.topCenter,
    this.padding = const EdgeInsets.all(12),
    this.monitor,
  });

  final Widget child;

  /// Où flotte le badge. La barre de progression de la découverte occupe déjà
  /// le haut de l'écran : `Alignment.topRight` est une alternative.
  final AlignmentGeometry alignment;

  final EdgeInsetsGeometry padding;

  /// Par défaut `BackendHealthMonitor.instance`. Pour les tests.
  final BackendHealthMonitor? monitor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned.fill(
          child: SafeArea(
            child: Align(
              alignment: alignment,
              child: Padding(
                padding: padding,
                child: BackendOfflineBadge(monitor: monitor),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// Conteneur affiché quand le backend est injoignable. Appuyer dessus retente
/// la connexion ; il disparaît dès que le backend répond.
///
/// Utilisable seul, par exemple dans la colonne de contrôles de la carte.
class BackendOfflineBadge extends StatelessWidget {
  const BackendOfflineBadge({super.key, this.monitor});

  /// Par défaut `BackendHealthMonitor.instance`. Pour les tests.
  final BackendHealthMonitor? monitor;

  @override
  Widget build(BuildContext context) {
    final monitor = this.monitor ?? BackendHealthMonitor.instance;
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return ValueListenableBuilder<BackendHealth>(
      valueListenable: monitor,
      builder: (context, health, _) {
        if (health == BackendHealth.online) return const SizedBox.shrink();

        final checking = health == BackendHealth.checking;
        final label = checking ? 'Reconnexion…' : 'Hors connexion';

        // Pas de Tooltip ici : ce badge vit dans le `builder` de MaterialApp,
        // donc au-dessus du Navigator, et Tooltip exige un Overlay ancêtre
        // (« No Overlay widget found »). Le libellé est de toute façon écrit
        // en clair à côté de l'icône, et Semantics porte la version longue.
        return Semantics(
          button: !checking,
          label: checking
              ? 'Reconnexion au serveur en cours'
              : 'Serveur injoignable. Appuyer pour réessayer.',
          child: Material(
            elevation: 2,
            borderRadius: BorderRadius.circular(13),
            color: scheme.errorContainer,
            child: InkWell(
              borderRadius: BorderRadius.circular(13),
              onTap: checking ? null : () => unawaited(monitor.recheck()),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox.square(
                      dimension: 18,
                      child: checking
                          ? CircularProgressIndicator(
                              strokeWidth: 2,
                              color: scheme.onErrorContainer,
                            )
                          : Icon(
                              Icons.cloud_off_rounded,
                              size: 18,
                              color: scheme.onErrorContainer,
                            ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      label,
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: scheme.onErrorContainer,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
