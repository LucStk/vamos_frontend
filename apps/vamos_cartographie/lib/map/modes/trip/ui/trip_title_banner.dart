import 'package:material_ui/material_ui.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/domain_features/trip/injection/trip_store.dart';

/// Le titre du voyage, affiché en haut à l'entrée dans le trip : il apparaît
/// en fondu, reste un instant, puis repart en glissant vers le haut.
///
/// Il ne capte aucun geste : la carte reste utilisable dessous.
class TripTitleBanner extends ConsumerStatefulWidget {
  const TripTitleBanner({super.key, required this.tripId, this.topOffset = 0});

  final TripId tripId;

  /// Hauteur à sauter en plus, quand quelque chose occupe déjà le haut de
  /// l'écran (la barre d'auteur d'un voyage qui n'est pas le nôtre).
  final double topOffset;

  /// Sous la rangée du compte et de la recherche (qui reste utilisable).
  static const _top = 76.0;

  @override
  ConsumerState<TripTitleBanner> createState() => _TripTitleBannerState();
}

class _TripTitleBannerState extends ConsumerState<TripTitleBanner>
    with SingleTickerProviderStateMixin {
  static const _fadeIn = 400;
  static const _hold = 2400;
  static const _fadeOut = 500;

  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: _fadeIn + _hold + _fadeOut),
  );

  /// 0 → 1 à l'apparition, 1 pendant la pause, 1 → 0 à la sortie.
  late final Animation<double> _visibility = TweenSequence<double>([
    TweenSequenceItem(
      tween: Tween(
        begin: 0.0,
        end: 1.0,
      ).chain(CurveTween(curve: Curves.easeOut)),
      weight: _fadeIn.toDouble(),
    ),
    TweenSequenceItem(tween: ConstantTween(1.0), weight: _hold.toDouble()),
    TweenSequenceItem(
      tween: Tween(
        begin: 1.0,
        end: 0.0,
      ).chain(CurveTween(curve: Curves.easeIn)),
      weight: _fadeOut.toDouble(),
    ),
  ]).animate(_controller);

  @override
  void initState() {
    super.initState();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final title = ref
        .watch(tripRequiredProvider(widget.tripId).select((t) => t.title))
        .trim();
    if (title.isEmpty) return const SizedBox.shrink();

    return IgnorePointer(
      child: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              16,
              TripTitleBanner._top + widget.topOffset,
              16,
              0,
            ),
            child: AnimatedBuilder(
              animation: _visibility,
              builder: (context, child) {
                final t = _visibility.value;
                if (_controller.isCompleted) return const SizedBox.shrink();
                return Opacity(
                  opacity: t,
                  // Monte un peu en sortant, descend un peu en entrant.
                  child: Transform.translate(
                    offset: Offset(0, (1 - t) * -14),
                    child: child,
                  ),
                );
              },
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 500),
                child: Material(
                  elevation: 6,
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(20),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Text(
                      title,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
