import 'dart:io';
import 'package:flutter/material.dart';
import 'package:media_application/read_models/image_ui_model.dart';

// Lightbox fullscreen
// ─────────────────────────────────────────────────────────────────────────────

class LightBox extends StatefulWidget {
  final List<ImageUiModel> items;
  final int initialIndex;

  const LightBox({super.key, required this.items, required this.initialIndex});

  @override
  State<LightBox> createState() => LightBoxState();
}

class LightBoxState extends State<LightBox> {
  late final PageController _ctrl;
  late int _index;

  @override
  void initState() {
    super.initState();
    _index = widget.initialIndex;
    _ctrl = PageController(initialPage: _index);
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  void _prev() {
    if (_index > 0) {
      _ctrl.previousPage(
        duration: const Duration(milliseconds: 280),
        curve: Curves.easeInOut,
      );
    }
  }

  void _next() {
    if (_index < widget.items.length - 1) {
      _ctrl.nextPage(
        duration: const Duration(milliseconds: 280),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Stack(
        fit: StackFit.expand,
        children: [
          PageView.builder(
            controller: _ctrl,
            itemCount: widget.items.length,
            onPageChanged: (i) => setState(() => _index = i),
            itemBuilder: (_, i) => _buildPage(widget.items[i]),
          ),

          if (_index > 0)
            Positioned(
              left: 12,
              top: 0,
              bottom: 0,
              child: Center(
                child: LightBoxArrow(icon: Icons.chevron_left, onTap: _prev),
              ),
            ),

          if (_index < widget.items.length - 1)
            Positioned(
              right: 12,
              top: 0,
              bottom: 0,
              child: Center(
                child: LightBoxArrow(icon: Icons.chevron_right, onTap: _next),
              ),
            ),

          Positioned(
            bottom: 24,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(99),
                ),
                child: Text(
                  '${_index + 1} / ${widget.items.length}',
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
            ),
          ),

          Positioned(
            top: MediaQuery.of(context).padding.top + 8,
            right: 12,
            child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                width: 38,
                height: 38,
                decoration: const BoxDecoration(
                  color: Colors.black54,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.close, color: Colors.white, size: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(ImageUiModel item) {
    final image = switch (item.imageLocation) {
      LocalPath(:final File file) => Image.file(file, fit: BoxFit.contain),
      RemoteUrl(:final url) => Image.network(
        url as String,
        fit: BoxFit.contain,
        loadingBuilder: (_, child, prog) {
          if (prog == null) return child;
          return const Center(
            child: CircularProgressIndicator(color: Colors.white),
          );
        },
        errorBuilder: (_, _, _) => const Center(
          child: Icon(
            Icons.broken_image_outlined,
            size: 64,
            color: Colors.white38,
          ),
        ),
      ),
    };

    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: Center(child: image),
    );
  }
}

class LightBoxArrow extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const LightBoxArrow({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 42,
        height: 42,
        decoration: const BoxDecoration(
          color: Colors.black54,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 26),
      ),
    );
  }
}
