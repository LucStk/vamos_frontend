import 'package:domain_core/domain_core.dart';

/// Une donnée du serveur n'a pas pu être convertie en objet du domaine.
///
/// Cas typique : une valeur d'enum ajoutée côté serveur, inconnue de cette
/// version de l'application (`gUnknownEnumValue`). Le message affiché reste
/// générique ; [target], [value] et [detail] servent au diagnostic.
class MappingFailure extends Failure {
  MappingFailure({required this.target, this.value, this.detail})
    : super(
        "Une réponse du serveur n'a pas pu être lue. "
        "Si le problème persiste, mettez l'application à jour.",
      );

  /// Valeur d'enum reçue mais inconnue du client.
  MappingFailure.unknownEnumValue(String target)
    : this(target: target, detail: "valeur d'enum inconnue du client");

  /// Type du domaine qu'on cherchait à produire, ex. `'GeometrySource'`.
  final String target;

  /// Valeur brute reçue, quand elle est disponible.
  final Object? value;

  /// Précision pour les logs.
  final String? detail;

  @override
  List<Object?> get props => [...super.props, target, value, detail];

  @override
  String toString() => [
    'MappingFailure($target',
    if (value != null) ': $value',
    if (detail != null) ' — $detail',
    ')',
  ].join();
}
