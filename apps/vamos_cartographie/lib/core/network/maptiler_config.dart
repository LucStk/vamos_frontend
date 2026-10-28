import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract final class MaptilerConfig {
  static String? get url => dotenv.env['MAPTILER_KEY'];
}
