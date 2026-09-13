import 'package:domain_core/notification/notification.dart';
import 'package:stored_file_application/stored_file_application.dart';
import 'package:vamos_cartographie/vamos_cartographie.dart';
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

extension GFileAttachmentX on GFileAttachment {
  StoredFileRemoteModel toRemoteModel() {
    return file.toRemoteModel();
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
