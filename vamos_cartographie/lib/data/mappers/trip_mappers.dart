import 'package:vamos_cartographie/domain/models.dart';

extension TripGraphQLMapper on Trip {
  GTripInput toGQLInput() {
    return GTripInput(title: title, description: Value.present(description));
  }
}
