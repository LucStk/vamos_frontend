import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/route/injection/route_insights_provider.dart';
import 'package:vamos_cartographie/domain_features/trip/presentation/mobility_type_display.dart';
import 'package:vamos_cartographie/map/entities/common/stats/stat_item.dart';
import 'package:vamos_cartographie/map/entities/trip/sheet_pages/stats/route_insights_labels.dart';

/// Le parcours d'une modalité à pied ou à vélo : profil d'élévation, nature
/// des voies (type de route, revêtement, aménagement cyclable).
///
/// Ces informations sont calculées par le serveur APRÈS le tracé : elles
/// peuvent manquer, ou être périmées si la route a changé depuis. Le
/// propriétaire peut alors relancer le calcul.
class MobilityInsightsPanel extends ConsumerStatefulWidget {
  const MobilityInsightsPanel({
    super.key,
    required this.tripId,
    required this.mobility,
    required this.editable,
  });

  final TripId tripId;
  final MobilityType mobility;
  final bool editable;

  @override
  ConsumerState<MobilityInsightsPanel> createState() =>
      _MobilityInsightsPanelState();
}

class _MobilityInsightsPanelState extends ConsumerState<MobilityInsightsPanel> {
  bool _busy = false;
  String? _failure;

  Future<void> _recompute() async {
    setState(() {
      _busy = true;
      _failure = null;
    });
    final failure = await recomputeRouteInsights(ref, widget.tripId);
    if (!mounted) return;
    setState(() {
      _busy = false;
      _failure = failure == null
          ? null
          : 'Le recalcul a échoué, réessaie dans un instant.';
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!insightsMobilities.contains(widget.mobility)) {
      return const SizedBox.shrink();
    }
    final theme = Theme.of(context);
    final async = ref.watch(routeInsightsProvider(widget.tripId));

    return async.when(
      loading: () => const Padding(
        padding: EdgeInsets.symmetric(vertical: 16),
        child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
      ),
      error: (_, _) => _Notice(
        icon: Icons.cloud_off_outlined,
        message: 'Impossible de charger les informations du parcours.',
        action: _RecomputeButton(
          label: 'Réessayer',
          busy: false,
          onPressed: () =>
              ref.invalidate(routeInsightsProvider(widget.tripId)),
        ),
      ),
      data: (insights) {
        final mobility = insights?.of(widget.mobility);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Divider(height: 28),
            Text(
              'Parcours',
              style: theme.textTheme.labelLarge?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 8),
            if (insights == null)
              _Notice(
                icon: Icons.hourglass_empty,
                message:
                    'Le dénivelé et la nature des voies ne sont pas encore '
                    'calculés.',
                action: widget.editable
                    ? _RecomputeButton(
                        label: 'Calculer',
                        busy: _busy,
                        onPressed: _recompute,
                      )
                    : null,
              )
            else ...[
              if (insights.isStale)
                _Notice(
                  icon: Icons.update,
                  message:
                      'La route a changé depuis le dernier calcul : ces '
                      'valeurs peuvent ne plus correspondre.',
                  action: widget.editable
                      ? _RecomputeButton(
                          label: 'Recalculer',
                          busy: _busy,
                          onPressed: _recompute,
                        )
                      : null,
                ),
              _ElevationSection(
                mobility: mobility,
                error: insights.elevationError,
                color: widget.mobility.display.color,
                recompute: widget.editable
                    ? _RecomputeButton(
                        label: 'Réessayer',
                        busy: _busy,
                        onPressed: _recompute,
                      )
                    : null,
              ),
              const SizedBox(height: 16),
              _WaysSection(
                mobility: mobility,
                kind: widget.mobility,
                error: insights.waysError,
                recompute: widget.editable
                    ? _RecomputeButton(
                        label: 'Réessayer',
                        busy: _busy,
                        onPressed: _recompute,
                      )
                    : null,
              ),
            ],
            if (_failure != null) ...[
              const SizedBox(height: 8),
              Text(
                _failure!,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.error,
                ),
              ),
            ],
          ],
        );
      },
    );
  }
}

// ---------------------------------------------------------------------------
// Élévation
// ---------------------------------------------------------------------------

class _ElevationSection extends StatelessWidget {
  const _ElevationSection({
    required this.mobility,
    required this.error,
    required this.color,
    required this.recompute,
  });

  final MobilityInsights? mobility;
  final String? error;
  final Color color;
  final Widget? recompute;

  @override
  Widget build(BuildContext context) {
    final m = mobility;
    if (m == null || !m.hasElevation) {
      return _Notice(
        icon: Icons.terrain,
        message: error ?? 'Pas de données d’altitude pour ce parcours.',
        action: recompute,
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: _MiniFigure(
                icon: Icons.trending_up,
                label: 'Dénivelé positif',
                value: _meters(m.ascentM),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _MiniFigure(
                icon: Icons.trending_down,
                label: 'Dénivelé négatif',
                value: _meters(m.descentM),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 130,
          child: CustomPaint(
            painter: _ElevationPainter(
              points: m.profile,
              color: color,
              textStyle:
                  Theme.of(context).textTheme.labelSmall ?? const TextStyle(),
              gridColor: Theme.of(context).colorScheme.outlineVariant,
              textColor: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            size: Size.infinite,
          ),
        ),
        if (error != null) ...[
          const SizedBox(height: 8),
          _Notice(icon: Icons.info_outline, message: error!),
        ],
      ],
    );
  }
}

String _meters(double? v) => v == null ? '—' : '${v.round()} m';

class _MiniFigure extends StatelessWidget {
  const _MiniFigure({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20, color: theme.colorScheme.primary),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(value, style: theme.textTheme.titleSmall),
                Text(
                  label,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Altitude en fonction de la distance : aire sous la courbe, altitudes
/// extrêmes à gauche, distance totale en bas à droite.
class _ElevationPainter extends CustomPainter {
  _ElevationPainter({
    required this.points,
    required this.color,
    required this.textStyle,
    required this.gridColor,
    required this.textColor,
  });

  final List<ElevationPoint> points;
  final Color color;
  final TextStyle textStyle;
  final Color gridColor;
  final Color textColor;

  static const _leftGutter = 44.0;
  static const _bottomGutter = 16.0;

  @override
  void paint(Canvas canvas, Size size) {
    if (points.length < 2) return;

    final plot = Rect.fromLTRB(
      _leftGutter,
      4,
      size.width - 4,
      size.height - _bottomGutter,
    );
    final totalM = points.last.distanceM;
    var lo = points.map((p) => p.elevationM).reduce(min);
    var hi = points.map((p) => p.elevationM).reduce(max);
    // Un profil plat reste un trait lisible, pas une division par zéro.
    if (hi - lo < 10) {
      final mid = (hi + lo) / 2;
      lo = mid - 5;
      hi = mid + 5;
    }
    if (totalM <= 0) return;

    Offset at(ElevationPoint p) => Offset(
      plot.left + plot.width * (p.distanceM / totalM),
      plot.bottom - plot.height * ((p.elevationM - lo) / (hi - lo)),
    );

    // Repères horizontaux : altitudes min et max.
    final grid = Paint()
      ..color = gridColor
      ..strokeWidth = 1;
    for (final y in [plot.top, plot.bottom]) {
      canvas.drawLine(Offset(plot.left, y), Offset(plot.right, y), grid);
    }

    final line = Path()..moveTo(at(points.first).dx, at(points.first).dy);
    for (final p in points.skip(1)) {
      final o = at(p);
      line.lineTo(o.dx, o.dy);
    }
    final area = Path.from(line)
      ..lineTo(plot.right, plot.bottom)
      ..lineTo(plot.left, plot.bottom)
      ..close();
    canvas.drawPath(
      area,
      Paint()
        ..shader = LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [color.withValues(alpha: 0.45), color.withValues(alpha: 0.05)],
        ).createShader(plot),
    );
    canvas.drawPath(
      line,
      Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 2
        ..strokeJoin = StrokeJoin.round,
    );

    _label(canvas, '${hi.round()} m', Offset(0, plot.top - 6), _leftGutter - 4);
    _label(
      canvas,
      '${lo.round()} m',
      Offset(0, plot.bottom - 10),
      _leftGutter - 4,
    );
    _label(
      canvas,
      '0',
      Offset(plot.left, plot.bottom + 2),
      40,
      align: TextAlign.left,
    );
    _label(
      canvas,
      formatDistance(totalM),
      Offset(plot.right - 60, plot.bottom + 2),
      60,
      align: TextAlign.right,
    );
  }

  void _label(
    Canvas canvas,
    String text,
    Offset at,
    double width, {
    TextAlign align = TextAlign.right,
  }) {
    final painter = TextPainter(
      text: TextSpan(
        text: text,
        style: textStyle.copyWith(color: textColor),
      ),
      textAlign: align,
      textDirection: TextDirection.ltr,
      maxLines: 1,
    )..layout(maxWidth: width, minWidth: width);
    painter.paint(canvas, at);
  }

  @override
  bool shouldRepaint(_ElevationPainter old) =>
      old.points != points || old.color != color;
}

// ---------------------------------------------------------------------------
// Nature des voies
// ---------------------------------------------------------------------------

class _WaysSection extends StatelessWidget {
  const _WaysSection({
    required this.mobility,
    required this.kind,
    required this.error,
    required this.recompute,
  });

  final MobilityInsights? mobility;
  final MobilityType kind;
  final String? error;
  final Widget? recompute;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final m = mobility;
    if (m == null || !m.hasWays) {
      return _Notice(
        icon: Icons.alt_route,
        message:
            error ??
            'Aucune voie à analyser : le tracé est à main levée ou hors '
                'réseau.',
        action: recompute,
      );
    }

    final total = m.totalM ?? 0;
    final analyzed = m.analyzedM ?? 0;
    final coverage = total > 0 ? (analyzed / total).clamp(0.0, 1.0) : 1.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _ShareList(
          title: 'Type de voie',
          shares: m.roadKinds,
          label: roadKindLabel,
        ),
        if (kind == MobilityType.bike && m.cycleInfrastructure.isNotEmpty) ...[
          const SizedBox(height: 16),
          _ShareList(
            title: 'Aménagement cyclable',
            shares: m.cycleInfrastructure,
            label: cycleLabel,
          ),
        ],
        const SizedBox(height: 16),
        _ShareList(
          title: 'Revêtement',
          shares: m.surfaces,
          label: surfaceLabel,
        ),
        if (coverage < 0.99) ...[
          const SizedBox(height: 12),
          Text(
            'Nature connue sur ${(coverage * 100).round()} % du parcours : le '
            'reste est tracé à main levée ou hors du réseau.',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
        if (error != null) ...[
          const SizedBox(height: 8),
          _Notice(icon: Icons.info_outline, message: error!, action: recompute),
        ],
      ],
    );
  }
}

/// Une répartition : barre empilée, puis une ligne par catégorie.
class _ShareList extends StatelessWidget {
  const _ShareList({
    required this.title,
    required this.shares,
    required this.label,
  });

  final String title;
  final List<WayShare> shares;
  final String Function(String key) label;

  static const _maxRows = 6;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final total = shares.fold(0.0, (sum, s) => sum + s.lengthM);
    if (total <= 0) return const SizedBox.shrink();

    final shown = shares.take(_maxRows).toList();
    final restM = shares.skip(_maxRows).fold(0.0, (sum, s) => sum + s.lengthM);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: theme.textTheme.labelLarge?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: SizedBox(
            height: 10,
            child: Row(
              children: [
                for (final s in shown)
                  Expanded(
                    flex: max(1, (s.lengthM / total * 1000).round()),
                    child: ColoredBox(color: shareColor(context, s.key)),
                  ),
                if (restM > 0)
                  Expanded(
                    flex: max(1, (restM / total * 1000).round()),
                    child: ColoredBox(color: theme.colorScheme.outlineVariant),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        for (final s in shown)
          _ShareRow(
            color: shareColor(context, s.key),
            label: label(s.key),
            ratio: s.lengthM / total,
            lengthM: s.lengthM,
          ),
        if (restM > 0)
          _ShareRow(
            color: theme.colorScheme.outlineVariant,
            label: 'Autres',
            ratio: restM / total,
            lengthM: restM,
          ),
      ],
    );
  }
}

class _ShareRow extends StatelessWidget {
  const _ShareRow({
    required this.color,
    required this.label,
    required this.ratio,
    required this.lengthM,
  });

  final Color color;
  final String label;
  final double ratio;
  final double lengthM;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          CircleAvatar(radius: 5, backgroundColor: color),
          const SizedBox(width: 8),
          Expanded(child: Text(label, style: theme.textTheme.bodyMedium)),
          Text(
            '${(ratio * 100).round()} % · ${formatDistance(lengthM)}',
            style: theme.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Messages et recalcul
// ---------------------------------------------------------------------------

class _Notice extends StatelessWidget {
  const _Notice({required this.icon, required this.message, this.action});

  final IconData icon;
  final String message;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 20, color: theme.colorScheme.onSurfaceVariant),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          if (action != null) ...[const SizedBox(width: 8), action!],
        ],
      ),
    );
  }
}

class _RecomputeButton extends StatelessWidget {
  const _RecomputeButton({
    required this.label,
    required this.busy,
    required this.onPressed,
  });

  final String label;
  final bool busy;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => FilledButton.tonalIcon(
    onPressed: busy ? null : onPressed,
    icon: busy
        ? const SizedBox(
            width: 16,
            height: 16,
            child: CircularProgressIndicator(strokeWidth: 2),
          )
        : const Icon(Icons.refresh, size: 18),
    label: Text(label),
    style: FilledButton.styleFrom(
      visualDensity: VisualDensity.compact,
      padding: const EdgeInsets.symmetric(horizontal: 12),
    ),
  );
}
