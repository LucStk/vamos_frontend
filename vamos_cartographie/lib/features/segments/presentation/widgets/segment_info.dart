import "package:flutter/material.dart";
import 'package:vamos_cartographie/shared/shared.dart';
import "package:vamos_cartographie/features/segments/domain/domain.dart";

class SegmentEditor extends StatefulWidget {
  final SegmentDraft initialSegment;
  const SegmentEditor({super.key, required this.initialSegment});

  @override
  State<SegmentEditor> createState() => SegmentEditorState(); // Public (sans _)
}

class SegmentEditorState extends State<SegmentEditor> {
  late SegmentDraft currentSegment; // Accessible par la GlobalKey

  @override
  void initState() {
    super.initState();
    currentSegment = widget.initialSegment;
  }

  void _patch(SegmentDraft newSegment) {
    setState(() {
      currentSegment = newSegment;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Juste la colonne de champs, pas de ScrollView ici, le Shell s'en occupe
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // ── Type ───────────────────────────────
        TypeSelector(
          values: SegmentType.values,
          selectedType: currentSegment.type,

          onTypeChanged: (newType) {
            _patch(currentSegment.copyWith(type: newType));
          },
        ),
      ],
    );
  }
}
