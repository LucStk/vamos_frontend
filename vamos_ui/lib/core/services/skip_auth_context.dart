import 'package:gql_exec/gql_exec.dart';

/// Un marqueur de contexte pour indiquer qu'une requête ne nécessite pas d'authentification.
class SkipAuthContext extends ContextEntry {
  const SkipAuthContext();

  List<Object> get fields => [];

  @override
  List<Object?> get fieldsForEquality => [];
}
