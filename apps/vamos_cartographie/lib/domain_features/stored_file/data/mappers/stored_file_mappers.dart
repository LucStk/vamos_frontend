import 'package:stored_file_application/stored_file_application.dart';
import 'package:vamos_cartographie/vamos_cartographie.dart';
import '/stored_file/data/graphql/graphql.dart';

import 'package:domain_core/domain_core.dart';

extension GStoredFileX on GStoredFile {
  StoredFileRemoteModel toDomain() {
    return StoredFileRemoteModel(
      id: StoredFileId(id),
      filename: filename,
      url: url,
    );
  }
}

extension GFileAttachmentX on GFileAttachmentData {
  StoredFileRemoteModel toDomain() {
    return file.toDomain();
  }
}

extension TargetTypeMapper on TargetType {
  GFileTargetTypeEnum toGql() => switch (this) {
    TargetType.trip => GFileTargetTypeEnum.TRIP,
    TargetType.waypoint => GFileTargetTypeEnum.WAYPOINT,
  };
}

extension GTargetTypeEnumMapper on GFileTargetTypeEnum {
  TargetType toModel() => switch (this) {
    GFileTargetTypeEnum.TRIP => TargetType.trip,
    GFileTargetTypeEnum.WAYPOINT => TargetType.waypoint,
    _ => throw Exception(
      NotFoundFailure(resourceType: "OwnerType", resourceId: "$this"),
    ),
  };
}
