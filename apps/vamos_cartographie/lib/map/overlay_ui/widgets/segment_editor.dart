import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_application/trip_application.dart';
import 'package:vamos_cartographie/features/features.dart';
import '/topology/presentation/mobility_type_display.dart';

class SegmentEditor extends ConsumerStatefulWidget {
  final SegmentFields initialSegment;
  final Future<void> Function(WidgetRef ref, SegmentFields segment) onSubmit;
  final String successMessage;
  const SegmentEditor({
    super.key,
    required this.initialSegment,
    required this.onSubmit,
    required this.successMessage,
  });

  @override
  ConsumerState<SegmentEditor> createState() => _SegmentEditorState(); // Public (sans _)
}

class _SegmentEditorState extends ConsumerState<SegmentEditor> {
  late SegmentPatchModel currentSegment; // Accessible par la GlobalKey

  @override
  void initState() {
    super.initState();
    currentSegment = SegmentPatchModel.fromFields(widget.initialSegment);
  }

  void _submit(SegmentPatchModel newSegment) async {
    try {
      await widget.onSubmit(ref, newSegment);

      if (!mounted) return;

      Navigator.of(context).pop();

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(widget.successMessage)));
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      if (mounted) {
        setState(() {
          currentSegment = newSegment;
        });
      }
    }
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
          values: MobilityTypeStyle.values,
          selectedType: MobilityTypeStyle.from(currentSegment.mobilityType),

          onTypeChanged: (newType) {
            _submit(currentSegment.copyWith(mobilityType: newType.type));
          },
        ),
      ],
    );
  }
}
