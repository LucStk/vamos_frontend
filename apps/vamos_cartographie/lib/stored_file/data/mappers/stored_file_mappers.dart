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

extension OwnerTypeMapper on OwnerType {
  GOwnerTypeEnum toGql() => switch (this) {
    OwnerType.trip => GOwnerTypeEnum.TRIP,
    OwnerType.waypoint => GOwnerTypeEnum.WAYPOINT,
  };
}

extension GOwnerTypeMapper on GOwnerTypeEnum {
  OwnerType toModel() => switch (this) {
    GOwnerTypeEnum.TRIP => OwnerType.trip,
    GOwnerTypeEnum.WAYPOINT => OwnerType.waypoint,
    _ => throw Exception(
      NotFoundFailure(resourceType: "OwnerType", resourceId: "$this"),
    ),
  };
}
