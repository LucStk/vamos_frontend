import 'package:domain_core/media.dart';
import 'package:vamos_cartographie/backend/graphql/graphql.dart';
import 'package:trip_domain/trip_domain.dart';

class MediaImageMappers {
  static MediaImage fromGQL(GImageFieldsData data) =>
      MediaImage(fileKey: FileKey(data.fileKey), url: Url(data.url));
}
