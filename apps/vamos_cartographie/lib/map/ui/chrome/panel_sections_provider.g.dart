// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'panel_sections_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Quels onglets du panneau de compte sont ouverts, gardé sur l'appareil
/// (`shared_preferences`), comme les voyages récents : c'est une commodité
/// locale, qui n'a rien à faire au serveur.
///
/// L'état vaut `null` tant que le disque n'a pas répondu. Les onglets sont
/// alors ouverts, comme par défaut, et c'est le passage de `null` à une valeur
/// qui remonte les `ExpansionTile` dans l'état retenu.

@ProviderFor(PanelSections)
final panelSectionsProvider = PanelSectionsProvider._();

/// Quels onglets du panneau de compte sont ouverts, gardé sur l'appareil
/// (`shared_preferences`), comme les voyages récents : c'est une commodité
/// locale, qui n'a rien à faire au serveur.
///
/// L'état vaut `null` tant que le disque n'a pas répondu. Les onglets sont
/// alors ouverts, comme par défaut, et c'est le passage de `null` à une valeur
/// qui remonte les `ExpansionTile` dans l'état retenu.
final class PanelSectionsProvider
    extends $NotifierProvider<PanelSections, Map<String, bool>?> {
  /// Quels onglets du panneau de compte sont ouverts, gardé sur l'appareil
  /// (`shared_preferences`), comme les voyages récents : c'est une commodité
  /// locale, qui n'a rien à faire au serveur.
  ///
  /// L'état vaut `null` tant que le disque n'a pas répondu. Les onglets sont
  /// alors ouverts, comme par défaut, et c'est le passage de `null` à une valeur
  /// qui remonte les `ExpansionTile` dans l'état retenu.
  PanelSectionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'panelSectionsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$panelSectionsHash();

  @$internal
  @override
  PanelSections create() => PanelSections();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Map<String, bool>? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Map<String, bool>?>(value),
    );
  }
}

String _$panelSectionsHash() => r'd4133a1ade88d8261da41d4cb5ee0a2293627b1a';

/// Quels onglets du panneau de compte sont ouverts, gardé sur l'appareil
/// (`shared_preferences`), comme les voyages récents : c'est une commodité
/// locale, qui n'a rien à faire au serveur.
///
/// L'état vaut `null` tant que le disque n'a pas répondu. Les onglets sont
/// alors ouverts, comme par défaut, et c'est le passage de `null` à une valeur
/// qui remonte les `ExpansionTile` dans l'état retenu.

abstract class _$PanelSections extends $Notifier<Map<String, bool>?> {
  Map<String, bool>? build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<Map<String, bool>?, Map<String, bool>?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Map<String, bool>?, Map<String, bool>?>,
              Map<String, bool>?,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
