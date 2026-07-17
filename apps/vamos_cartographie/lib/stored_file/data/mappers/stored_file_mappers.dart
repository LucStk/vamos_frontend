import 'package:domain_core/id.dart';
import 'package:stored_file_application/stored_file_application.dart';
import '/stored_file/data/graphql/graphql.dart';

class StoredFileMappers {
  static StoredFile fromGQL(GStoredFile data) => StoredFile(
    id: Id<StoredFile>(data.id),
    filename: data.filename,
    url: data.filename,
    status: data.status,
  );
}
