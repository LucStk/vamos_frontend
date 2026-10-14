import 'package:flutter/material.dart';

class PanelLateral extends StatefulWidget {
  const PanelLateral({
    super.key,
    required this.child,
    this.width = 350,
    this.initiallyOpen = true,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeInOut,
  });

  final Widget child;
  final double width;
  final bool initiallyOpen;
  final Duration duration;
  final Curve curve;

  @override
  State<PanelLateral> createState() => _PanelLateralState();
}

class _PanelLateralState extends State<PanelLateral> {
  late bool _isOpen = widget.initiallyOpen;

  static const double _buttonSize = 40;
  static const double _buttonOverlap = 20;

  void _toggle() {
    setState(() {
      _isOpen = !_isOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _isOpen ? widget.width : _buttonSize - _buttonOverlap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Panneau
          AnimatedContainer(
            duration: widget.duration,
            curve: widget.curve,
            width: _isOpen ? widget.width : 0,
            height: double.infinity,
            child: ClipRect(
              child: SizedBox(
                width: widget.width,
                height: double.infinity,
                child: widget.child,
              ),
            ),
          ),

          // Bouton
          Positioned(
            top: 16,
            right: -_buttonOverlap,
            child: Material(
              elevation: 4,
              color: Theme.of(context).colorScheme.surface,
              shape: const CircleBorder(),
              clipBehavior: Clip.antiAlias,
              child: SizedBox(
                width: _buttonSize,
                height: _buttonSize,
                child: IconButton(
                  padding: EdgeInsets.zero,
                  icon: Icon(
                    _isOpen ? Icons.chevron_left : Icons.chevron_right,
                  ),
                  tooltip: _isOpen ? 'Fermer le panneau' : 'Ouvrir le panneau',
                  onPressed: _toggle,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
