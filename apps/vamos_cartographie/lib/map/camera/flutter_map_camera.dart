import 'dart:async';
import 'dart:math';

import 'package:domain_core/domain_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_animations/flutter_map_animations.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_engine/map_engine.dart';
import 'package:vamos_cartographie/map/camera/camera_vision.dart';
import 'package:vamos_cartographie/map/camera/map_geo_mappers.dart';

/// Implémentation unique de [MapCameraController].
///
/// Toujours utilisable dès sa création (basée sur un [MapController] brut).
/// Quand un [AnimatedMapController] est attaché — typiquement au montage
/// du widget carte — les actions (zoom, rotation...) passent par lui pour
/// bénéficier des animations. Tant qu'il n'est pas attaché (ou après un
/// détachement), elles retombent sur le [MapController] brut, de façon
/// instantanée.
///
/// ## Suivi de la caméra
/// Un seul abonnement au [MapController] ([markReady]) est relayé vers :
/// - [events] : le flux d'événements bruts, utilisable à tout moment
///   (il n'émet simplement rien avant le montage de la carte) ;
/// - [changes] : un [Listenable] pour `ListenableBuilder` / `CustomPainter`.
class FlutterMapCamera implements MapCameraController {
  FlutterMapCamera(this.mapController, {CameraVision? initialVision})
    : initialCameraFit = initialVision == null
          ? null
          : CameraFit.bounds(bounds: initialVision.bounds.toFlutterMap());

  /// null si aucune vision initiale n'a été demandée : MapOptions retombera
  /// alors sur son initialCenter/initialZoom par défaut.
  final CameraFit? initialCameraFit;

  /// Zoom du repère « monde » : la projection monde est fixe, indépendante
  /// du zoom et du centre courants.
  static const referenceZoom = 0.0;

  final MapController mapController;
  AnimatedMapController? _animatedController;

  // ---- Cycle de vie et événements ----

  /// `true` une fois le widget carte monté (la caméra est alors lisible).
  final ValueNotifier<bool> ready = ValueNotifier(false);

  // Asynchrone (par défaut) : un listener qui déplace la caméra ne peut pas
  // réentrer dans la livraison de l'événement en cours.
  final StreamController<MapEvent> _events = StreamController.broadcast();
  final ValueNotifier<int> _revision = ValueNotifier(0);
  final ValueNotifier<Size> _size = ValueNotifier(Size.zero);
  StreamSubscription<MapEvent>? _mapSub;

  /// Taille de la carte. Ne notifie que si elle change réellement (resize,
  /// rotation d'écran), contrairement à [changes] qui émet à chaque frame de
  /// pan. `Size.zero` tant que la carte n'est pas montée.
  ValueListenable<Size> get sizeListenable => _size;

  final ValueNotifier<double> _zoomScaleNotifier = ValueNotifier(1.0);

  /// Échelle monde → écran. Ne notifie que si le zoom change réellement :
  /// un pan ou une rotation n'émettent rien. Valeur par défaut `1.0` avant le
  /// montage de la carte.
  ValueListenable<double> get zoomScaleListenable => _zoomScaleNotifier;

  /// Événements de la carte (pan, zoom, rotation, taps...), avec leur source.
  /// Abonnable avant le montage : le flux n'émet rien tant que [markReady]
  /// n'a pas été appelé.
  Stream<MapEvent> get events => _events.stream;

  /// Notifie à chaque événement de la carte. Ne transporte pas l'événement :
  /// pour filtrer sur sa source, utiliser [events].
  Listenable get changes => _revision;

  /// À appeler quand le widget carte est monté (`MapOptions.onMapReady`).
  ///
  /// L'abonnement n'est pas créé dans le constructeur : `mapEventStream`
  /// n'est utilisable qu'une fois le `FlutterMap` monté. Si la carte est
  /// remontée avec le même [MapController], l'ancien abonnement est remplacé.
  void markReady() {
    _mapSub?.cancel();
    _size.value = _camera.size;
    _zoomScaleNotifier.value = zoomScale;
    _mapSub = mapController.mapEventStream.listen((e) {
      // No-op si inchangés (== sur Size et double).
      _size.value = _camera.size;
      _zoomScaleNotifier.value = zoomScale;
      _events.add(e);
      _revision.value++;
    });
    ready.value = true;
  }

  /// À appeler dans le `dispose` du scope qui a créé la caméra.
  void dispose() {
    _disposed = true;
    _mapSub?.cancel();
    detachAnimatedController();
    unawaited(_events.close());
    _revision.dispose();
    _size.dispose();
    _zoomScaleNotifier.dispose();
    ready.dispose();
  }

  void attachAnimatedController(TickerProvider ticker) {
    _animatedController?.dispose(); // protège d'un double attach
    _animatedController = AnimatedMapController(
      vsync: ticker,
      mapController: mapController,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOutCubic,
    );
  }

  void markDetached() {
    if (_disposed) return;
    ready.value = false;
    _mapSub?.cancel();
    _mapSub = null;
    detachAnimatedController();
  }

  bool _disposed = false;

  void detachAnimatedController() {
    _animatedController?.dispose();
    _animatedController = null;
  }

  bool get _hasAnimation => _animatedController != null;

  MapCamera get _camera => mapController.camera;

  // ---- Lecture : toujours via le MapController brut ----

  @override
  WorldOffset latLngToWorldOffset(LatLng position) =>
      WorldOffset(_camera.projectAtZoom(position, referenceZoom));

  @override
  double get zoomScale => _camera.getZoomScale(_camera.zoom, referenceZoom);

  @override
  LatLng get center => _camera.center;

  @override
  CameraPose get pose => CameraPose(
    center: _camera.center,
    zoom: _camera.zoom,
    rotationDeg: _camera.rotation,
  );

  @override
  double get rotation => _camera.rotation;

  @override
  double get rotationRad => _camera.rotationRad;

  @override
  Size get size => _camera.size;

  MapLatLngBounds get visibleBounds => _camera.visibleBounds.toMapEngine();

  @override
  ScreenOffset get screenCenter =>
      ScreenOffset(_camera.nonRotatedSize.center(Offset.zero));

  @override
  WorldOffset get worldCenter =>
      WorldOffset(_camera.projectAtZoom(_camera.center, referenceZoom));

  // ---- Conversions ----

  Matrix4 get transformMatrix => buildCameraTransform(
    scale: zoomScale,
    screenCenter: screenCenter,
    worldCenter: worldCenter,
    rotationRad: rotationRad,
  );

  @override
  ScreenOffset worldToScreen(WorldOffset offset) {
    final result = MatrixUtils.transformPoint(transformMatrix, offset.value);
    return ScreenOffset(result);
  }

  @override
  WorldOffset screenToWorld(ScreenOffset offset) {
    final result = MatrixUtils.transformPoint(
      Matrix4.inverted(transformMatrix),
      offset.value,
    );
    return WorldOffset(result);
  }

  @override
  ScreenOffset latLngToScreenOffset(LatLng position) =>
      ScreenOffset(_camera.getOffsetFromOrigin(position));

  @override
  LatLng screenOffsetToLatLng(ScreenOffset offset) =>
      _camera.offsetToCrs(offset.value);

  @override
  LatLng worldOffsetToLatLng(WorldOffset offset) =>
      _camera.unprojectAtZoom(offset.value, referenceZoom);

  // ---- Flux (contrat de MapCameraController) ----

  @override
  Stream<double> get rotationStream => events.map((_) => _camera.rotation);

  @override
  Stream<void> get cameraStream => events.map((_) {});

  // ---- Actions : animées si possible, sinon instantanées ----

  @override
  void restore(CameraPose p) {
    final animated = _animatedController;
    if (animated != null) {
      animated.animateTo(dest: p.center, zoom: p.zoom, rotation: p.rotationDeg);
    } else {
      mapController.moveAndRotate(p.center, p.zoom, p.rotationDeg);
    }
  }

  @override
  void zoomTo(LatLng latLng, {double deltaZoom = 1}) {
    final targetZoom = min(_camera.zoom + deltaZoom, _camera.maxZoom ?? 20);

    if (_hasAnimation) {
      _animatedController!.animateTo(dest: latLng, zoom: targetZoom);
    } else {
      mapController.move(latLng, targetZoom);
    }
  }

  @override
  void zoomIn({LatLng? latLng}) {
    final zoom = min(_camera.zoom + 1, _camera.maxZoom ?? 20);

    if (_hasAnimation) {
      _animatedController!.animateTo(
        dest: latLng ?? _camera.center,
        zoom: zoom,
      );
    } else {
      mapController.move(latLng ?? _camera.center, zoom);
    }
  }

  @override
  void zoomOut() {
    if (_hasAnimation) {
      _animatedController!.animatedZoomOut();
    } else {
      mapController.move(
        _camera.center,
        max(_camera.zoom - 1, _camera.minZoom ?? 0),
      );
    }
  }

  @override
  void panTo(LatLng center) {
    final animated = _animatedController;
    if (animated != null) {
      animated.animateTo(dest: center, zoom: _camera.zoom); // zoom inchangé
    } else {
      mapController.move(center, _camera.zoom);
    }
  }

  @override
  void rotateTo(double degrees) {
    if (_hasAnimation) {
      _animatedController!.animatedRotateTo(degrees);
    } else {
      mapController.rotate(degrees);
    }
  }

  @override
  void fitBounds(
    MapLatLngBounds bounds, {
    MapEdgeInsets padding = MapEdgeInsets.zero,
    double? maxZoom,
  }) {
    final fit = CameraFit.bounds(
      bounds: bounds.toFlutterMap(),
      padding: EdgeInsets.fromLTRB(
        padding.left,
        padding.top,
        padding.right,
        padding.bottom,
      ),
      maxZoom: maxZoom,
    );

    final animated = _animatedController;
    if (animated != null) {
      animated.animatedFitCamera(cameraFit: fit);
    } else {
      mapController.fitCamera(fit);
    }
  }
}
