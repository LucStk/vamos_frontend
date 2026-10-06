import 'package:stored_file_application/domain/domain.dart';

import '/domain_features/stored_file/data/data.dart';
import 'stored_file_mappers.dart';

extension GUploadConfigFieldsX on GUploadConfigFields {
  UploadConfigModel toModel() {
    return UploadConfigModel(
      file: file.toDomain(),
      uploadUrl: uploadUrl,
      fileKey: fileKey,
      contentType: contentType,
    );
  }
}
