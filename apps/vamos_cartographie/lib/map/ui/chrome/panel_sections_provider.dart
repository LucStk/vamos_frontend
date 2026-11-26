import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'panel_sections_provider.g.dart';

/// Quels onglets du panneau de compte sont ouverts, gardé sur l'appareil
/// (`shared_preferences`), comme les voyages récents : c'est une commodité
/// locale, qui n'a rien à faire au serveur.
///
/// L'état vaut `null` tant que le disque n'a pas répondu. Les onglets sont
/// alors ouverts, comme par défaut, et c'est le passage de `null` à une valeur
/// qui remonte les `ExpansionTile` dans l'état retenu.
@Riverpod(keepAlive: true)
class PanelSections extends _$PanelSections {
  static const _key = 'account_panel_sections';

  @override
  Map<String, bool>? build() {
    _restore();
    return null;
  }

  Future<void> _restore() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_key);
    if (raw == null) {
      state = const {};
      return;
    }

    try {
      state = {
        for (final entry in (jsonDecode(raw) as Map<String, dynamic>).entries)
          entry.key: entry.value as bool,
      };
    } catch (_) {
      // Illisible : on repart de zéro plutôt que de laisser le panneau en
      // panne. Tous les onglets s'ouvrent.
      await prefs.remove(_key);
      state = const {};
    }
  }

  /// Un onglet jamais refermé s'ouvre.
  bool isOpen(String id) => state?[id] ?? true;

  void setOpen(String id, {required bool open}) {
    state = {...?state, id: open};
    _save();
  }

  Future<void> _save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, jsonEncode(state ?? const <String, bool>{}));
  }
}
