import 'package:stored_file_application/stored_file_application.dart';
import '/stored_file/data/graphql/graphql.dart';

extension GStoredFileX on GStoredFile {
  StoredFileRemoteModel toRemoteModel() {
    return StoredFileRemoteModel(
      id: StoredFileId(id),
      filename: filename,
      url: url,
    );
  }
}
