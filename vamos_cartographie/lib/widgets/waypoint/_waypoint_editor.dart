import "package:flutter/material.dart";
import 'package:vamos_cartographie/domain/domain.dart';
import 'package:vamos_cartographie/widgets/carousel/carousel.dart';
import "_waypoint_header.dart";
import "../shared/types_selector/waypoint_type_selector.dart";
import '../shared/text_area_counter.dart';

class WaypointEditor extends StatefulWidget {
  final Waypoint waypoint;

  const WaypointEditor({super.key, required this.waypoint});

  @override
  State<WaypointEditor> createState() => _WaypointEditorState();
}

class _WaypointEditorState extends State<WaypointEditor> {
  // C'est ici qu'on stocke la copie locale qui va muter
  late Waypoint _localWaypoint;

  @override
  void initState() {
    super.initState();
    // On initialise notre copie locale avec le waypoint d'origine.
    // (Note : Si ton modèle Waypoint possède une méthode .copyWith(), c'est le moment idéal pour l'utiliser)
    _localWaypoint = widget.waypoint;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // ── Contenu scrollable ──
        Flexible(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // 1. Modification du Titre
                TextFormField(
                  initialValue: _localWaypoint.title ?? '',
                  decoration: const InputDecoration(
                    labelText: 'Titre du waypoint',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (newTitle) {
                    setState(() {
                      // On met à jour notre copie locale
                      _localWaypoint = _localWaypoint.copyWith(title: newTitle);
                    });
                  },
                ),

                // 4. Modification de la Description
                const Divider(),
                TextAreaWithCounter(
                  initialValue: _localWaypoint.description ?? '',
                  readOnly: false,
                  onChanged: (newDescription) {
                    setState(() {
                      _localWaypoint = _localWaypoint.copyWith(
                        description: newDescription,
                      );
                    });
                  },
                ),
                // 3. Modification des Photos
                const SizedBox(height: 4),
                ImageCarouselPicker(
                  remoteImages: _localWaypoint.images ?? [],
                  readOnly: false,
                  onChanged: (newImages) {
                    setState(() {
                      // Ajuste selon ce que renvoie ton ImageCarouselPicker
                      _localWaypoint = _localWaypoint.copyWith(
                        images: newImages,
                      );
                    });
                  },
                ),
                const SizedBox(height: 16),
                WaypointHeader(type: _localWaypoint.type),
                const SizedBox(height: 12),

                // 2. Modification du Type
                WaypointTypeSelector(
                  selectedType: _localWaypoint.type,
                  onTypeChanged: (newType) {
                    setState(() {
                      _localWaypoint = _localWaypoint.copyWith(type: newType);
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
