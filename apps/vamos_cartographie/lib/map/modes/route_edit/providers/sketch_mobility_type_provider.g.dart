// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sketch_mobility_type_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Type de mobilité choisi pendant le dessin du tracé.
///
/// Partagé entre le panneau d'actions (sélecteur, validation) et, si besoin,
/// la couche carte (couleur du tracé en cours).
///
/// autoDispose : le choix revient à « marche » en quittant le mode sketch.
/// Pour mémoriser le dernier choix, utilise `@Riverpod(keepAlive: true)`.

@ProviderFor(SketchMobilityType)
final sketchMobilityTypeProvider = SketchMobilityTypeProvider._();

/// Type de mobilité choisi pendant le dessin du tracé.
///
/// Partagé entre le panneau d'actions (sélecteur, validation) et, si besoin,
/// la couche carte (couleur du tracé en cours).
///
/// autoDispose : le choix revient à « marche » en quittant le mode sketch.
/// Pour mémoriser le dernier choix, utilise `@Riverpod(keepAlive: true)`.
final class SketchMobilityTypeProvider
    extends $NotifierProvider<SketchMobilityType, MobilityType> {
  /// Type de mobilité choisi pendant le dessin du tracé.
  ///
  /// Partagé entre le panneau d'actions (sélecteur, validation) et, si besoin,
  /// la couche carte (couleur du tracé en cours).
  ///
  /// autoDispose : le choix revient à « marche » en quittant le mode sketch.
  /// Pour mémoriser le dernier choix, utilise `@Riverpod(keepAlive: true)`.
  SketchMobilityTypeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sketchMobilityTypeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sketchMobilityTypeHash();

  @$internal
  @override
  SketchMobilityType create() => SketchMobilityType();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MobilityType value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MobilityType>(value),
    );
  }
}

String _$sketchMobilityTypeHash() =>
    r'82ebeb6a7bd0fd4b82ae3f0ca50e161729681505';

/// Type de mobilité choisi pendant le dessin du tracé.
///
/// Partagé entre le panneau d'actions (sélecteur, validation) et, si besoin,
/// la couche carte (couleur du tracé en cours).
///
/// autoDispose : le choix revient à « marche » en quittant le mode sketch.
/// Pour mémoriser le dernier choix, utilise `@Riverpod(keepAlive: true)`.

abstract class _$SketchMobilityType extends $Notifier<MobilityType> {
  MobilityType build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<MobilityType, MobilityType>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MobilityType, MobilityType>,
              MobilityType,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
