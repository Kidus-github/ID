class FirebaseExceptions implements Exception {
  final String code;

  FirebaseExceptions(this.code);

  String get message {
    print('FirebaseException2');
    switch (code) {
      case 'unknown':
        return 'An unknown Firebase error occurred. Please try again.';
      case 'invalid-custom-token':
        return 'The custom token format is incorrect. Please check your custom token.';
      case 'custom-token-mismatch':
        return 'The custom token corresponds to a different audience.';
      case 'user-disabled':
        return 'The user account has been disabled. Please contact support for assistance.';
      case 'user-not-found':
        return 'No user found for the given email or UID.';
      case 'invalid-email':
        return 'The email address provided is invalid. Please enter a valid email.';
      case 'email-already-in-use':
        return 'The email address is already registered. Please use a different email.';
      case 'wrong-password':
        return 'Incorrect password. Please check your password and try again.';
      case 'weak-password':
        return 'The password is too weak. Please choose a stronger password.';
      case 'provider-already-linked':
        return 'The account is already linked with another provider.';
      case 'operation-not-allowed':
        return 'This operation is not allowed. Contact support for assistance.';
      case 'invalid-credential':
        return 'The supplied credential is malformed or has expired.';
      case 'invalid-verification-code':
        return 'Invalid verification code. Please enter a valid code.';
      case 'invalid-verification-id':
        return 'Invalid verification ID. Please request a new verification code.';
      case 'captcha-check-failed':
        return 'The reCAPTCHA response is invalid. Please try again.';
      case 'app-not-authorized':
        return 'The app is not authorized to use Firebase Authentication with the provided API key.';
      case 'keychain-error':
        return 'A keychain error occurred. Please check the keychain and try again.';
      case 'internal-error':
        return 'An internal authentication error occurred. Please try again later.';
      case 'invalid-app-credential':
        return 'The app credential is invalid. Please provide a valid app credential.';
      case 'user-mismatch':
        return 'The supplied credentials do not correspond to the previously signed-in user.';
      case 'requires-recent-login':
        return 'This operation is sensitive and requires recent authentication. Please log in again.';
      case 'quota-exceeded':
        return 'Quota exceeded. Please try again later.';
      case 'account-exists-with-different-credential':
        return 'An account already exists with the same email but different sign-in credentials.';
      case 'missing-iframe-start':
        return 'The email template is missing the iframe start tag.';
      case 'missing-iframe-end':
        return 'The email template is missing the iframe end tag.';
      case 'missing-iframe-src':
        return 'The email template is missing the iframe src attribute.';
      case 'auth-domain-config-required':
        return 'The authDomain configuration is required for the action code verification link.';
      case 'missing-app-credential':
        return 'The app credential is missing. Please provide valid app credentials.';
      case 'session-cookie-expired':
        return 'The Firebase session cookie has expired. Please sign in again.';
      case 'uid-already-exists':
        return 'The provided user ID is already in use by another user.';
      case 'web-storage-unsupported':
        return 'Web storage is not supported or is disabled.';
      case 'app-deleted':
        return 'This instance of FirebaseApp has been deleted.';
      case 'user-token-mismatch':
        return 'The provided user\'s token has a mismatch with the authenticated user\'s user ID.';
      case 'invalid-message-payload':
        return 'The email template verification message payload is invalid.';
      case 'invalid-sender':
        return 'The email template sender is invalid. Please verify the sender\'s email.';
      case 'invalid-recipient-email':
        return 'The recipient email address is invalid. Please provide a valid recipient email.';
      case 'missing-action-code':
        return 'The action code is missing. Please provide a valid action code.';
      case 'user-token-expired':
        return 'The user\'s token has expired. Please sign in again.';
      case 'INVALID_LOGIN_CREDENTIALS':
        return 'Invalid login credentials.';
      case 'expired-action-code':
        return 'The action code has expired. Please request a new action code.';
      case 'invalid-action-code':
        return 'The action code is invalid. Please check the code and try again.';
      case 'credential-already-in-use':
        return 'This credential is already associated with a different user account.';
      case 'network-request-failed':
        return 'Network error. Please check your internet connection and try again.';
      case 'too-many-requests':
        return 'Too many requests. Please wait and try again later.';
      case 'user-token-revoked':
        return 'The user\'s token has been revoked. Please sign in again.';
      case 'missing-email':
        return 'The email address is missing. Please enter your email.';
      case 'missing-password':
        return 'The password is missing. Please enter your password.';
      case 'popup-blocked':
        return 'The sign-in popup was blocked by the browser. Please enable popups and try again.';
      case 'popup-closed-by-user':
        return 'The sign-in popup was closed before completing the sign-in process.';
      case 'unauthorized-domain':
        return 'This domain is not authorized for OAuth operations for your Firebase project.';
      default:
        return 'An unknown error occurred. Please try again.';
    }
  }
}
