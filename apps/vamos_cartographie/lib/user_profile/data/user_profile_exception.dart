sealed class CreateProfileException implements Exception {
  const CreateProfileException();
}

class UsernameAlreadyTakenException extends CreateProfileException {
  const UsernameAlreadyTakenException();
}

class InvalidUsernameException extends CreateProfileException {
  const InvalidUsernameException();
}

class ProfileCreationFailed extends CreateProfileException {
  const ProfileCreationFailed();
}
