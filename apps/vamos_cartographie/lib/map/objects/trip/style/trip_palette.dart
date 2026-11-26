import 'dart:ui';

import 'package:trip_application/trip_application.dart';

/// Couleurs des tracés de découverte : distinctes entre elles, et assez
/// soutenues pour rester lisibles sous le contour noir translucide du tracé.
const _palette = [
  Color(0xFFE53935), // rouge
  Color(0xFFFB8C00), // orange
  Color(0xFFFFB300), // ambre
  Color(0xFF7CB342), // vert pomme
  Color(0xFF00897B), // sarcelle
  Color(0xFF00ACC1), // cyan
  Color(0xFF1E88E5), // bleu
  Color(0xFF5E35B1), // violet
  Color(0xFFD81B60), // rose
  Color(0xFF6D4C41), // brun
];

/// Couleur d'un voyage : celle de son tracé sur la carte, et celle du contour
/// de sa carte résumé.
///
/// Tirée de l'identifiant, et non du hasard : la découverte réémet sa liste à
/// chaque mouvement de caméra, et des couleurs tirées au sort changeraient à
/// chaque fois. Deux voyages peuvent tomber sur la même couleur (il n'y en a
/// que dix) ; c'est la sélection, pas la couleur, qui dit lequel est en avant.
Color tripColor(TripId id) => _palette[_hash(id.value) % _palette.length];

/// FNV-1a 32 bits. `String.hashCode` ferait l'affaire aujourd'hui, mais rien
/// ne garantit sa stabilité d'une version de Dart à l'autre, et un voyage doit
/// garder sa couleur.
int _hash(String s) {
  var h = 0x811c9dc5;
  for (final unit in s.codeUnits) {
    h = ((h ^ unit) * 0x01000193) & 0xFFFFFFFF;
  }
  return h;
}
