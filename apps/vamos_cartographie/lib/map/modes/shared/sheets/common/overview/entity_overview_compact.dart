import 'package:domain_core/domain_core.dart';
import 'package:flutter/material.dart';
import 'package:vamos_cartographie/map/modes/shared/sheets/common/photos/owner_photo_strip.dart';
import 'package:vamos_cartographie/map/modes/trip_ready/ui/widgets/header/trip_header.dart';
// TODO: déplacer TripHeader ici (common/overview/editable_title.dart) : il
// n'a rien de spécifique au trip, et common ne doit pas dépendre de trip_edit.
import 'package:vamos_cartographie/map/ui/chrome/sheets/draggable_bottom_sheet_shell.dart';

/// Page compacte "Aperçu" commune : [leading] facultatif, titre éditable,
/// chevron de dépliage, puis les photos du propriétaire.
class EntityOverviewCompact extends StatelessWidget {
  const EntityOverviewCompact({
    super.key,
    required this.title,
    required this.ownerId,
    this.leading,
    this.canEdit = false,
    this.onRename,
  });

  final String title;
  final PhotoOwnerId ownerId;

  /// Par exemple l'icône de catégorie d'un waypoint.
  final Widget? leading;

  final bool canEdit;
  final Future<Failure?> Function(String newTitle)? onRename;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (leading != null) ...[leading!, const SizedBox(width: 8)],
            Expanded(
              child: TripHeader(
                title: title,
                canEdit: canEdit && onRename != null,
                onRename: onRename ?? (_) async => null,
              ),
            ),
            const SheetExpandButton(),
          ],
        ),
        const Spacer(),
        OwnerPhotoStrip(ownerId: ownerId, editable: canEdit),
      ],
    );
  }
}
