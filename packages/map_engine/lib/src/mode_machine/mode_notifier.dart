// import 'base_mode_model.dart';
// import 'gesture_result.dart';
// import 'mode_event.dart';
//
// final class ModeNotifier<M extends BaseMode<M>> extends ValueNotifier<M> {
//   ModeNotifier(super.initial, this._resolver);
//
//   final ModeCommandResolver<M> _resolver;
//
//   void send(ModeEvent event) => _apply(value.reduce(event));
//
//   void _apply(GestureResult<M>? r) {
//     if (r == null) return;
//     final next = r.mode;
//     if (next != null) value = next;
//     final p = r.pending;
//     if (p != null) _run(p);
//   }
//
//   Future<void> _run(PendingRun<M> p) async {
//     final result = await _resolver.resolve(p.command);
//     if (result == null) return; // l'effet a échoué
//     _apply(p.then?.call(value, result)); // `value` = mode courant
//   }
// }
