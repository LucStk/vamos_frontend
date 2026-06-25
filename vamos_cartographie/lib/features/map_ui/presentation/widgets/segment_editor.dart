import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trip_domain/domain/entities/entities.dart';
import 'package:vamos_cartographie/features/shared/shared.dart';
import 'package:vamos_cartographie/features/topology/mobility_types_ui.dart';

class SegmentEditor extends ConsumerStatefulWidget {
  final Segment initialSegment;
  final Future<void> Function(WidgetRef ref, Segment segment) onSubmit;
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
  late Segment currentSegment; // Accessible par la GlobalKey

  @override
  void initState() {
    super.initState();
    currentSegment = widget.initialSegment;
  }

  void _submit(Segment newSegment) async {
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
          values: MobilityTypeUi.values,
          selectedType: MobilityTypeUi.from(currentSegment.mobilityType),

          onTypeChanged: (newType) {
            _submit(currentSegment.copyWith(mobilityType: newType.type));
          },
        ),
      ],
    );
  }
}
