part of 'failures.dart';

final class NotFoundFailure extends Failure {
  final String? resourceType;
  final String? resourceId;
  const NotFoundFailure({this.resourceType, this.resourceId})
    : super("Ressource introuvable");

  @override
  List<Object?> get props => [...super.props, resourceType, resourceId];
  // Optionnel : une méthode pour faciliter le debug/log
  @override
  String toString() => 'NotFoundFailure($resourceType #$resourceId): $message';
}
