import '../domain/space/offset_type.dart';
import 'transition.dart';
import 'mode_command.dart';

sealed class BaseCommand<R extends Object> extends ModeCommand<Never, R> {
  const BaseCommand();
}

final class ZoomIn extends BaseCommand<Done> {
  const ZoomIn(this.position);
  final ScreenOffset position;
}

final class ShowToast extends BaseCommand<Done> {
  const ShowToast(this.message);
  final String message;
}

final class HapticFeedback extends BaseCommand<Done> {
  const HapticFeedback();
}

final class CopyToClipboard extends BaseCommand<Done> {
  const CopyToClipboard(this.text);
  final String text;
}
