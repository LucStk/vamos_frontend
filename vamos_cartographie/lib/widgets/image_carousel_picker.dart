import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_selector/file_selector.dart';
import 'package:image_picker/image_picker.dart';

class ImageCarouselPicker extends StatefulWidget {
  final List<String> imagePaths;
  final void Function(List<String>) onChanged;
  final bool readOnly;

  const ImageCarouselPicker({
    super.key,
    required this.imagePaths,
    required this.onChanged,
    this.readOnly = false,
  });

  @override
  State<ImageCarouselPicker> createState() => _ImageCarouselPickerState();
}

class _ImageCarouselPickerState extends State<ImageCarouselPicker> {
  late List<String> _paths;
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _paths = List<String>.from(widget.imagePaths);
  }

  Future<void> _pickImages() async {
    List<String> picked = [];
    if (Platform.isLinux || Platform.isWindows || Platform.isMacOS) {
      const typeGroup = XTypeGroup(
        label: 'Images',
        extensions: ['jpg', 'jpeg', 'png', 'gif', 'webp'],
      );
      final files = await openFiles(acceptedTypeGroups: [typeGroup]);
      picked = files.map((x) => x.path).toList();
    } else {
      final picker = ImagePicker();
      final images = await picker.pickMultiImage();
      picked = images.map((x) => x.path).toList();
    }
    if (picked.isEmpty) return;
    setState(() {
      _paths.addAll(picked);
      _currentIndex = _paths.length - 1;
    });
    widget.onChanged(List<String>.from(_paths));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _paths.length - 1,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  void _deleteCurrentImage() {
    if (_paths.isEmpty) return;
    setState(() {
      _paths.removeAt(_currentIndex);
      if (_currentIndex >= _paths.length && _currentIndex > 0) {
        _currentIndex = _paths.length - 1;
      }
    });
    widget.onChanged(List<String>.from(_paths));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_pageController.hasClients && _paths.isNotEmpty) {
        _pageController.jumpToPage(_currentIndex);
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Bouton d'ajout : masqué en readOnly
        if (!widget.readOnly)
          GestureDetector(
            onTap: _pickImages,
            child: Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.shade400,
                  width: 1.5,
                  style: BorderStyle.solid,
                ),
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade50,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_photo_alternate_outlined,
                    size: 32,
                    color: Colors.grey.shade500,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Appuyer pour ajouter des images',
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                  ),
                  if (_paths.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        '${_paths.length} image(s) chargée(s)',
                        style: TextStyle(
                          color: Colors.blue.shade600,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        // Message si aucune photo en readOnly
        if (widget.readOnly && _paths.isEmpty)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey.shade50,
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Column(
              children: [
                Icon(
                  Icons.photo_library_outlined,
                  size: 28,
                  color: Colors.grey.shade400,
                ),
                const SizedBox(height: 6),
                Text(
                  'Aucune photo',
                  style: TextStyle(color: Colors.grey.shade400, fontSize: 13),
                ),
              ],
            ),
          ),
        if (_paths.isNotEmpty) ...[
          const SizedBox(height: 12),
          SizedBox(
            height: 200,
            child: Stack(
              alignment: Alignment.center,
              children: [
                PageView.builder(
                  controller: _pageController,
                  itemCount: _paths.length,
                  onPageChanged: (i) => setState(() => _currentIndex = i),
                  itemBuilder: (_, i) => ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.file(File(_paths[i]), fit: BoxFit.contain),
                  ),
                ),
                Positioned(
                  left: 8,
                  child: _NavButton(
                    icon: Icons.chevron_left,
                    onTap: _currentIndex > 0
                        ? () => _pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          )
                        : null,
                  ),
                ),
                Positioned(
                  right: 8,
                  child: _NavButton(
                    icon: Icons.chevron_right,
                    onTap: _currentIndex < _paths.length - 1
                        ? () => _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          )
                        : null,
                  ),
                ),
                Positioned(
                  bottom: 8,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(99),
                    ),
                    child: Text(
                      '${_currentIndex + 1} / ${_paths.length}',
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
                // Bouton supprimer : masqué en readOnly
                if (!widget.readOnly)
                  Positioned(
                    top: 8,
                    right: 12,
                    child: GestureDetector(
                      onTap: _deleteCurrentImage,
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: const BoxDecoration(
                          color: Colors.black54,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.delete_outline,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _paths.length,
              (i) => AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                margin: const EdgeInsets.symmetric(horizontal: 3),
                width: _currentIndex == i ? 18 : 7,
                height: 7,
                decoration: BoxDecoration(
                  color: _currentIndex == i
                      ? Colors.blue.shade600
                      : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(99),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 60,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _paths.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (_, i) => GestureDetector(
                onTap: () => _pageController.animateToPage(
                  i,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                ),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: _currentIndex == i
                          ? Colors.blue.shade600
                          : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.file(
                      File(_paths[i]),
                      width: 56,
                      height: 56,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class _NavButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const _NavButton({required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedOpacity(
        opacity: onTap != null ? 1.0 : 0.3,
        duration: const Duration(milliseconds: 200),
        child: Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: Colors.white70,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Icon(icon, size: 20, color: Colors.black87),
        ),
      ),
    );
  }
}
