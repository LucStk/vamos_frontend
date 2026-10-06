import 'base_mode_model.dart';

abstract class ModeCommand<M extends BaseMode<M>> {
  const ModeCommand();
}

abstract class ModeCommandPayload<M extends BaseMode<M>> {
  const ModeCommandPayload();
}

abstract class ModeCommandResolver<M extends BaseMode<M>> {
  const ModeCommandResolver();
  Future<ModeCommandPayload<M>> resolve(ModeCommand<M> command);
}

abstract class IntentEvent<M extends BaseMode<M>> {
  const IntentEvent();
}
