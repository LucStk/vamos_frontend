import 'dart:convert';
import 'dart:io';
import 'package:api_client/api_client.dart';

import '../models.dart';

class StorageService {
  static const String _fileName = 'bike_trip.json';

  /// Retourne le fichier de sauvegarde, quel que soit le système d'exploitation.
  static Future<File> _getFile() async {
    final dir = await _getStorageDirectory();
    await dir.create(recursive: true);
    return File('${dir.path}/$_fileName');
  }

  static Future<Directory> _getStorageDirectory() async {
    if (Platform.isLinux) {
      // Respecte XDG_DATA_HOME, sinon fallback sur ~/.local/share/<appName>
      final xdg = Platform.environment['XDG_DATA_HOME'];
      final base = (xdg != null && xdg.isNotEmpty)
          ? xdg
          : '${Platform.environment['HOME']}/.local/share';
      return Directory('$base/vamos_cartographie');
    }

    if (Platform.isWindows) {
      final appData = Platform.environment['APPDATA'];
      if (appData != null && appData.isNotEmpty) {
        return Directory('$appData\\vamos_cartographie');
      }
      return Directory(
        '${Platform.environment['USERPROFILE']}\\AppData\\Roaming\\vamos_cartographie',
      );
    }

    if (Platform.isMacOS) {
      return Directory(
        '${Platform.environment['HOME']}/Library/Application Support/vamos_cartographie',
      );
    }

    // Android / iOS : dossier temporaire accessible en écriture
    return Directory(
      '${Platform.environment['HOME'] ?? '/tmp'}/vamos_cartographie',
    );
  }

  static Future<void> saveRoute(Trip trip) async {
    final file = await _getFile();
    final json = const JsonEncoder.withIndent(
      '  ',
    ).convert(trip.toGQLInput().toJson());
    await file.writeAsString(json);
  }

  static Future<Trip?> loadRoute() async {
    try {
      final file = await _getFile();
      if (!await file.exists()) return null;
      final contents = await file.readAsString();
      final json = jsonDecode(contents) as Map<String, dynamic>;
      return Trip.fromGQL(GGetTripData_trip.fromJson(json));
    } catch (_) {
      return null;
    }
  }

  /// Retourne le chemin du fichier de sauvegarde (utile pour déboguer).
  static Future<String> getSavePath() async {
    final file = await _getFile();
    return file.path;
  }
}
