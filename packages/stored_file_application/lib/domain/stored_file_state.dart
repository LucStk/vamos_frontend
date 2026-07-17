import 'package:domain_core/domain_core.dart';
import 'package:stored_file_application/domain/stored_file_model.dart';

extension StoreFileDisplayX on NodeState<StoredFileFields> {
  StoredFileFields get display => switch (this) {
    HasValue(value: final v) => v,
    HasPatch(patch: final p) => p as StoredFileFields,
  };
}

typedef StoreFileState = NodeState<StoredFileRemoteModel>;
