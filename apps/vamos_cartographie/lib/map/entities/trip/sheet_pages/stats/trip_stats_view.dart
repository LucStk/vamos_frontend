import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/trip/injection/trip_travel_stats_provider.dart';
import 'package:vamos_cartographie/domain_features/trip/presentation/mobility_type_display.dart';
import 'package:vamos_cartographie/map/entities/common/stats/stat_item.dart';
import 'package:vamos_cartographie/map/entities/trip/sheet_pages/stats/mobility_insights_panel.dart';

/// Page dépliée « Statistiques » d'un trip : distance, durée, et la
/// répartition des modalités en camembert. Toucher une part en détaille la
/// modalité dessous.
class TripStatsView extends ConsumerStatefulWidget {
  const TripStatsView({super.key, required this.trip, this.editable = false});

  final Trip trip;

  /// Le propriétaire peut relancer le calcul des informations de parcours.
  final bool editable;

  @override
  ConsumerState<TripStatsView> createState() => _TripStatsViewState();
}

class _TripStatsViewState extends ConsumerState<TripStatsView> {
  MobilityType? _selected;

  void _select(MobilityType? type) =>
      setState(() => _selected = type == _selected ? null : type);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final summary = ref.watch(tripTravelStatsProvider(widget.trip.id));

    if (summary.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Center(
          child: Text(
            'Aucune route pour l’instant.',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      );
    }

    final selected = summary.shares
        .where((s) => s.mobility == _selected)
        .firstOrNull;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: _FigureTile(
                icon: Icons.straighten,
                label: 'Distance totale',
                value: formatDistance(summary.totalDistanceM),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _FigureTile(
                icon: Icons.calendar_month_outlined,
                label: 'Durée du voyage',
                value: _plural(summary.totalDays, 'jour'),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          'Mobilités',
          style: theme.textTheme.labelLarge?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          'Part des jours de déplacement (${summary.travelDays}) passés avec '
          'chaque mobilité.',
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 12),
        Center(
          child: _MobilityPie(
            shares: summary.shares,
            total: summary.sharesTotalDays,
            selected: _selected,
            onSelect: _select,
          ),
        ),
        const SizedBox(height: 12),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 8,
          runSpacing: 4,
          children: [
            for (final s in summary.shares)
              ChoiceChip(
                avatar: Icon(
                  s.mobility.display.icon,
                  size: 18,
                  color: s.mobility.display.color,
                ),
                label: Text(
                  '${s.mobility.display.label} '
                  '${_percent(s.days / summary.sharesTotalDays)}',
                ),
                selected: s.mobility == _selected,
                onSelected: (_) => _select(s.mobility),
              ),
          ],
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutCubic,
          alignment: Alignment.topCenter,
          child: selected == null
              ? Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(
                    'Touchez une part du camembert pour en voir le détail.',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: _MobilityDetail(
                    key: ValueKey(selected.mobility),
                    share: selected,
                    dayRatio: selected.days / summary.sharesTotalDays,
                    tripId: widget.trip.id,
                    editable: widget.editable,
                  ),
                ),
        ),
      ],
    );
  }
}

/// « 1 jour », « 5 jours ».
String _plural(int n, String unit) => '$n $unit${n > 1 ? 's' : ''}';

String _percent(double ratio) => '${(ratio * 100).round()} %';

String _decimal(double v) => v.toStringAsFixed(1).replaceAll('.', ',');

class _FigureTile extends StatelessWidget {
  const _FigureTile({
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
    final scheme = theme.colorScheme;
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: scheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(icon, color: scheme.primary),
          const SizedBox(height: 6),
          Text(value, style: theme.textTheme.titleLarge),
          Text(
            label,
            style: theme.textTheme.bodySmall?.copyWith(
              color: scheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Camembert
// ---------------------------------------------------------------------------

class _MobilityPie extends StatelessWidget {
  const _MobilityPie({
    required this.shares,
    required this.total,
    required this.selected,
    required this.onSelect,
  });

  final List<MobilityShare> shares;
  final double total;
  final MobilityType? selected;
  final ValueChanged<MobilityType?> onSelect;

  static const _size = 200.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final painter = _PiePainter(
      slices: [
        for (final s in shares)
          _Slice(s.mobility, s.mobility.display.color, s.days / total),
      ],
      selected: selected,
      holeColor: theme.colorScheme.surface,
    );
    final chosen = shares.where((s) => s.mobility == selected).firstOrNull;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapUp: (d) {
        final hit = painter.sliceAt(d.localPosition, const Size.square(_size));
        // Un tap dans le trou ou hors du disque : on referme le détail.
        if (hit == null) {
          onSelect(selected);
        } else {
          onSelect(hit);
        }
      },
      child: SizedBox.square(
        dimension: _size,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(child: CustomPaint(painter: painter)),
            IgnorePointer(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (chosen != null) ...[
                    Icon(
                      chosen.mobility.display.icon,
                      color: chosen.mobility.display.color,
                    ),
                    Text(
                      _percent(chosen.days / total),
                      style: theme.textTheme.titleLarge,
                    ),
                  ] else
                    Text(
                      '${total.round()} j',
                      style: theme.textTheme.titleMedium,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Slice {
  const _Slice(this.type, this.color, this.ratio);
  final MobilityType type;
  final Color color;
  final double ratio;
}

class _PiePainter extends CustomPainter {
  _PiePainter({
    required this.slices,
    required this.selected,
    required this.holeColor,
  });

  final List<_Slice> slices;
  final MobilityType? selected;
  final Color holeColor;

  static const _start = -pi / 2;

  // Le disque et son trou, en proportion du côté : la part choisie dépasse.
  double _outer(Size size, bool popped) =>
      size.shortestSide / 2 * (popped ? 1 : 0.93);
  double _inner(Size size) => size.shortestSide / 2 * 0.58;

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    var from = _start;
    for (final s in slices) {
      final sweep = 2 * pi * s.ratio;
      final popped = s.type == selected;
      final outer = _outer(size, popped);
      final inner = _inner(size);
      final thickness = outer - inner;
      final paint = Paint()
        ..color = s.color
        ..style = PaintingStyle.stroke
        ..strokeWidth = thickness
        ..strokeCap = StrokeCap.butt;
      // Un trait de la épaisseur de l'anneau, centré sur son rayon moyen.
      final gap = slices.length > 1 ? 0.02 : 0.0;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: inner + thickness / 2),
        from + gap,
        max(sweep - 2 * gap, 0.001),
        false,
        paint,
      );
      from += sweep;
    }
  }

  /// La modalité sous [point], ou null (trou, hors du disque).
  MobilityType? sliceAt(Offset point, Size size) {
    final v = point - size.center(Offset.zero);
    final distance = v.distance;
    if (distance < _inner(size) || distance > _outer(size, true)) return null;

    // Angle depuis le haut, dans le sens horaire, ramené dans [0, 2π).
    var angle = atan2(v.dy, v.dx) - _start;
    angle = (angle % (2 * pi) + 2 * pi) % (2 * pi);

    var from = 0.0;
    for (final s in slices) {
      from += 2 * pi * s.ratio;
      if (angle <= from) return s.type;
    }
    return slices.lastOrNull?.type;
  }

  @override
  bool shouldRepaint(_PiePainter old) =>
      old.selected != selected ||
      old.holeColor != holeColor ||
      old.slices.length != slices.length ||
      !_sameSlices(old.slices);

  bool _sameSlices(List<_Slice> other) {
    for (var i = 0; i < slices.length; i++) {
      if (slices[i].type != other[i].type ||
          slices[i].ratio != other[i].ratio) {
        return false;
      }
    }
    return true;
  }
}

// ---------------------------------------------------------------------------
// Détail d'une modalité
// ---------------------------------------------------------------------------

class _MobilityDetail extends StatelessWidget {
  const _MobilityDetail({
    super.key,
    required this.share,
    required this.dayRatio,
    required this.tripId,
    required this.editable,
  });

  final MobilityShare share;
  final double dayRatio;
  final TripId tripId;
  final bool editable;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final style = share.mobility.display;
    final drawnRatio = share.drawnRatio ?? 0;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: scheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: style.color.withValues(alpha: 0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Icon(style.icon, color: style.color),
              const SizedBox(width: 8),
              Text(style.label, style: theme.textTheme.titleMedium),
              const Spacer(),
              Text(
                '${_percent(dayRatio)} du voyage',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: scheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _DetailRow('Distance', formatDistance(share.distanceM)),
          _DetailRow('Jours', _days(share.days)),
          _DetailRow(
            'Moyenne par jour',
            share.metersPerDay == null
                ? '—'
                : '${formatDistance(share.metersPerDay)} / jour',
          ),
          const SizedBox(height: 12),
          Text(
            'Nature du tracé',
            style: theme.textTheme.labelLarge?.copyWith(
              color: scheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 6),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: SizedBox(
              height: 8,
              child: Row(
                children: [
                  Expanded(
                    flex: ((1 - drawnRatio) * 1000).round(),
                    child: ColoredBox(color: scheme.primary),
                  ),
                  Expanded(
                    flex: (drawnRatio * 1000).round(),
                    child: ColoredBox(color: scheme.tertiary),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          _Legend(
            color: scheme.primary,
            label: 'Tracé routé',
            hint: 'suit de vraies voies, reproductible',
            ratio: 1 - drawnRatio,
            distance: share.routedM,
          ),
          const SizedBox(height: 4),
          _Legend(
            color: scheme.tertiary,
            label: 'Tracé à main levée',
            hint: 'dessiné à la main, approximatif',
            ratio: drawnRatio,
            distance: share.drawnM,
          ),
          // Dénivelé et nature des voies : à pied et à vélo.
          MobilityInsightsPanel(
            tripId: tripId,
            mobility: share.mobility,
            editable: editable,
          ),
        ],
      ),
    );
  }

  static String _days(double days) =>
      days < 1.05 && days > 0.95 ? '1 jour' : '${_decimal(days)} jours';
}

class _DetailRow extends StatelessWidget {
  const _DetailRow(this.label, this.value);

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          Text(value, style: theme.textTheme.titleSmall),
        ],
      ),
    );
  }
}

class _Legend extends StatelessWidget {
  const _Legend({
    required this.color,
    required this.label,
    required this.hint,
    required this.ratio,
    required this.distance,
  });

  final Color color;
  final String label;
  final String hint;
  final double ratio;
  final double distance;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 4, right: 8),
          child: CircleAvatar(radius: 5, backgroundColor: color),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: theme.textTheme.bodyMedium),
              Text(
                hint,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
        Text(
          '${_percent(ratio)} · ${formatDistance(distance)}',
          style: theme.textTheme.bodyMedium,
        ),
      ],
    );
  }
}
