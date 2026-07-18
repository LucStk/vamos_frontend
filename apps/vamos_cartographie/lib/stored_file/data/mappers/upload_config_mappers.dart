import 'package:stored_file_application/domain/domain.dart';
import 'package:vamos_cartographie/stored_file/data/graphql/__generated__/file_storage_fields.data.gql.dart';
import 'package:vamos_cartographie/stored_file/data/mappers/stored_file_mappers.dart';

extension GUploadConfigFieldsX on GUploadConfigFields {
  UploadConfigModel toModel() {
    return UploadConfigModel(
      file: file.toRemoteModel(),
      uploadUrl: uploadUrl,
      fileKey: fileKey,
      contentType: contentType,
    );
  }
}
