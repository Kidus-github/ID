class SignUpWithEmailAndPaswordFailure {
  final String message;

  const SignUpWithEmailAndPaswordFailure(
      [this.message = 'An Unknown error occurred.']);

  factory SignUpWithEmailAndPaswordFailure.code(String code) {
    switch (code) {
      case "weak-password":
        return const SignUpWithEmailAndPaswordFailure(
            'Please enter strong password');

      case "invalid-email":
        return const SignUpWithEmailAndPaswordFailure(
            'Email is not valid or badly formated ');
      case "email-already-in-use":
        return const SignUpWithEmailAndPaswordFailure(
            'An account already existes for that email');
      case "operation-not-allowed":
        return const SignUpWithEmailAndPaswordFailure(
            'Operation is not allowed. Please contact support.');
      case "user-disabled":
        return const SignUpWithEmailAndPaswordFailure(
            'This user has been disabled. Please contact support for help.');
      default:
        return SignUpWithEmailAndPaswordFailure();
    }
  }
}
