import 'package:stored_file_application/stored_file_application.dart';
import '/stored_file/data/graphql/graphql.dart';

class StoredFileMappers {
  static StoredFileRemoteModel fromGQL(GStoredFile data) =>
      StoredFileRemoteModel(
        id: StoredFileId(data.id),
        filename: data.filename,
        url: data.filename,
        status: data.status,
      );
}
