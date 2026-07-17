import 'package:domain_core/domain_core.dart';
import 'package:stored_file_application/stored_file_application.dart';

mixin StoredFileEditor on OptimisticRunner<StoredFileStore> {
  StoredFileRepository get storedFileRepo;
}
