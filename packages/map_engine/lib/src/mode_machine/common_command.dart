import '../domain/space/offset_type.dart';
import 'transition.dart';
import 'mode_command.dart';

sealed class CommonCommand<R extends Object> extends ModeCommand<Never, R> {
  const CommonCommand();
}

final class ZoomIn extends CommonCommand<Done> {
  const ZoomIn(this.position);
  final ScreenOffset position;
}

final class ShowToast extends CommonCommand<Done> {
  const ShowToast(this.message);
  final String message;
}

final class HapticFeedback extends CommonCommand<Done> {
  const HapticFeedback();
}

final class CopyToClipboard extends CommonCommand<Done> {
  const CopyToClipboard(this.text);
  final String text;
}
