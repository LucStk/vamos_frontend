import 'package:domain_core/domain_core.dart';
import 'package:trip_application/topology/domain/domain.dart';

extension VertexDisplayX on NodeState<VertexFields> {
  VertexFields get display => switch (this) {
    HasValue(value: final v) => v,
    HasPatch(patch: final p) => p as VertexFields,
  };
}

typedef VertexState = NodeState<VertexFields>;
