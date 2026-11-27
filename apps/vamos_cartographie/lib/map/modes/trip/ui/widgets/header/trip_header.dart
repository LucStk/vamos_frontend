import "package:domain_core/domain_core.dart";
import 'package:material_ui/material_ui.dart';
import "package:vamos_cartographie/ui_kit/inputs/inline_editable_text.dart";
import "package:vamos_cartographie/ui_kit/theme/theme.dart";

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
      style: Theme.of(context).textTheme.heading,
    );
  }
}
