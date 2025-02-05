class FirebaseAuthExceptions implements Exception {
  final String code;

  FirebaseAuthExceptions(this.code);

  String get message {
    print('FirebaseException');
    switch (code) {
      case 'email-already-in-use':
        return 'The email address is already registered. Please use a different email.';
      case 'invalid-email':
        return 'The email address provided is invalid. Please enter a valid email address.';
      case 'weak-password':
        return 'The password is too weak. Please choose a stronger password.';
      case 'user-disabled':
        return 'This user account has been disabled. Please contact support for assistance.';
      case 'user-not-found':
        return 'No user found for the given email or UID.';
      case 'wrong-password':
        return 'The password is invalid. Please check your password and try again.';
      case 'invalid-verification-code':
        return 'Invalid verification code. Please enter a valid code.';
      case 'invalid-verification-id':
        return 'Invalid verification ID. Please request a new verification code.';
      case 'quota-exceeded':
        return 'Quota exceeded. Please try again later.';
      case 'provider-already-linked':
        return 'The account is already linked to another provider.';
      case 'requires-recent-login':
        return 'This operation is sensitive and requires recent authentication. Please log in again.';
      case 'credential-already-in-use':
        return 'This credential is already associated with a different user account.';
      case 'user-mismatch':
        return 'The supplied credentials do not correspond to the previously signed-in user.';
      case 'account-exists-with-different-credential':
        return 'An account already exists with the same email but different sign-in credentials.';
      case 'operation-not-allowed':
        return 'This operation is not allowed. Contact support for assistance.';
      case 'expired-action-code':
        return 'The action code has expired. Please request a new action code.';
      case 'invalid-action-code':
        return 'The action code is invalid. Please check the code and try again.';
      case 'missing-action-code':
        return 'The action code is missing. Please provide a valid action code.';
      case 'user-token-expired':
        return 'The user\'s token has expired. Please sign in again.';
      case 'invalid-credential':
        return 'The supplied credential is malformed or has expired.';
      case 'user-token-revoked':
        return 'The user\'s token has been revoked. Please sign in again.';
      case 'invalid-message-payload':
        return 'The email template verification message payload is invalid.';
      case 'invalid-sender':
        return 'The email template sender is invalid. Please verify the sender\'s email.';
      case 'invalid-recipient-email':
        return 'The recipient email address is invalid. Please provide a valid recipient email.';
      case 'too-many-requests':
        return 'Too many requests. Please wait and try again later.';
      case 'network-request-failed':
        return 'Network error. Please check your internet connection and try again.';
      case 'app-not-authorized':
        return 'This app is not authorized to use Firebase Authentication with the provided API key.';
      case 'internal-error':
        return 'An internal error occurred. Please try again later.';
      case 'invalid-api-key':
        return 'The API key provided is invalid. Please check your Firebase configuration.';
      case 'invalid-user-token':
        return 'The user\'s token is invalid. Please sign in again.';
      case 'missing-email':
        return 'Email address is missing. Please enter your email.';
      case 'missing-password':
        return 'Password is missing. Please enter your password.';
      case 'popup-closed-by-user':
        return 'The sign-in popup was closed before completing the sign-in process.';
      case 'popup-blocked':
        return 'The sign-in popup was blocked by the browser. Please enable popups and try again.';
      case 'unauthorized-domain':
        return 'This domain is not authorized for OAuth operations for your Firebase project.';
      default:
        return 'An unknown error occurred. Please try again.';
    }
  }
}
