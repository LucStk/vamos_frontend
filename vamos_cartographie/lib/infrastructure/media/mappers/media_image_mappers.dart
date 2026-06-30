import 'package:media_application/media_application.dart';
import 'package:vamos_cartographie/backend/graphql/graphql.dart';

class MediaImageMappers {
  static MediaImage fromGQL(GImageFieldsData data) =>
      MediaImage(fileKey: FileKey(data.fileKey), url: Url(data.url));
}
