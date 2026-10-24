import "package:domain_core/domain_core.dart";
import "package:flutter/material.dart";
import "package:vamos_cartographie/ui_kit/inputs/inline_editable_text.dart";

/// En-tête commune (icône colorée, label du type, numéro d'étape).
class TripHeader extends StatelessWidget {
  const TripHeader({
    super.key,
    required this.title,
    this.canEdit = false,
    this.onRename,
  });

  final String title;
  final bool canEdit;
  final Future<Failure?> Function(String title)? onRename;

  @override
  Widget build(BuildContext context) {
    return InlineEditableText(
      text: title,
      canEdit: canEdit && onRename != null,
      onSave:
          onRename ??
          (_) async {
            return;
          },
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }
}
