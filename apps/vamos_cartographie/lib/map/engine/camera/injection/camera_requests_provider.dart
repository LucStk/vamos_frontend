import '/map/engine/camera/camera.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
part "camera_requests_provider.g.dart";

@Riverpod(keepAlive: true)
class CameraRequests extends _$CameraRequests {
  int _seq = 0;

  @override
  ({int id, CameraRequest request})? build() => null;

  void submit(CameraRequest request) => state = (id: ++_seq, request: request);
}
