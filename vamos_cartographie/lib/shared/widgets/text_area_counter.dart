import 'package:flutter/material.dart';

class TextAreaWithCounter extends StatefulWidget {
  final String initialValue;
  final void Function(String) onChanged;
  final bool readOnly;

  const TextAreaWithCounter({
    super.key,
    this.initialValue = '',
    required this.onChanged,
    this.readOnly = false,
  });

  @override
  State<TextAreaWithCounter> createState() => _TextAreaWithCounterState();
}

class _TextAreaWithCounterState extends State<TextAreaWithCounter> {
  late final TextEditingController _controller;
  final int _maxLength = 500;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialValue);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      readOnly: widget.readOnly,
      maxLines: 4,
      maxLength: widget.readOnly ? null : _maxLength,
      decoration: InputDecoration(
        labelText: 'Description',
        hintText: widget.readOnly ? null : 'Décrivez ce point de passage...',
        alignLabelWithHint: true,
        border: const OutlineInputBorder(),
        filled: widget.readOnly,
        fillColor: Colors.grey.shade50,
        counter: widget.readOnly
            ? const SizedBox.shrink()
            : ValueListenableBuilder(
                valueListenable: _controller,
                builder: (context, value, _) {
                  return Text(
                    '${value.text.length} / $_maxLength caractères',
                    style: TextStyle(
                      color: value.text.length >= _maxLength
                          ? Colors.red
                          : Colors.grey,
                    ),
                  );
                },
              ),
      ),
      onChanged: widget.readOnly
          ? null
          : (value) {
              setState(() {});
              widget.onChanged(value);
            },
    );
  }
}
