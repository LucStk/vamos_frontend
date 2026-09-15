part of "failures.dart";

sealed class CreateProfileFailure extends Failure {
  CreateProfileFailure({String? message})
    : super(message ?? "Erreur dans la création du profile");
}

class UsernameAlreadyTakenFailure extends CreateProfileFailure {
  UsernameAlreadyTakenFailure()
    : super(message: "Ce nom est déjà utilisé par un autre utilisateur");
}

class InvalidUsernameFailure extends CreateProfileFailure {
  InvalidUsernameFailure() : super(message: "Ce nom est invalide");
}

class ProfileCreationFailed extends CreateProfileFailure {
  ProfileCreationFailed() : super(message: "Impossible de créer le compte");
}

sealed class UpdateProfileFailure extends Failure {
  UpdateProfileFailure({String? message})
    : super(message ?? "Erreur dans la mise à jour du profile");
}

class ProfileUpdateFailed extends UpdateProfileFailure {
  ProfileUpdateFailed() : super(message: "Impossible de modifier le compte");
}
