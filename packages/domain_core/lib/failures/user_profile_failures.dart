part of "failures.dart";

sealed class CreateProfileFailure extends Failure {
  const CreateProfileFailure({String? message})
    : super((message != null) ? message : "Erreur dans la création du profile");
}

class UsernameAlreadyTakenFailure extends CreateProfileFailure {
  const UsernameAlreadyTakenFailure()
    : super(message: "Ce nom est déjà utilisé par un autre utilisateur");
}

class InvalidUsernameFailure extends CreateProfileFailure {
  const InvalidUsernameFailure() : super(message: "Ce nom est invalide");
}

class ProfileCreationFailed extends CreateProfileFailure {
  const ProfileCreationFailed()
    : super(message: "Impossible de créer le compte");
}
