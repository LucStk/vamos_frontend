import 'package:domain_core/domain_core.dart';
import 'package:trip_domain/trip_domain.dart';

class ObservableMediaStore extends MediaStore with Observable {
  @override
  void upsert(Id id, MediaImage image) {
    super.upsert(id, image);
    notify();
  }

  @override
  void remove(Id id, FileKey key) {
    super.remove(id, key);
    notify();
  }

  @override
  void clear() {
    super.clear();
    notify();
  }
}
