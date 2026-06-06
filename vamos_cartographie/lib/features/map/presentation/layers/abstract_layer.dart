import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class AbstractLayer extends ConsumerWidget {
  final int tripId;
  const AbstractLayer({super.key, required this.tripId});
}
