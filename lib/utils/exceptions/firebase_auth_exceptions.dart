class BFirebaseAuthException implements Exception {
  final String code;

  BFirebaseAuthException(this.code);

  String get message {
    switch (code) {
      case "email-already-in-use":
        return "The email address is already registered. Please use a different email";
      case "invalid-email":
        return "The email address provided is invalid. Please enter a valid email";
      case "weak-password":
        return "The password is too weak. Please choose a strong one";
      case "user-disabled":
        return "This user account has been disabled. Contact support for assistance";
      case "user-not-found":
        return "Invalid login details, user not found";
      case "wrong-password":
        return "Incorrect password. Please check password and try again";
      case "invalid-verification-code":
        return "Invalid verification code, enter a valid one";
      case "invalid-verification-id":
        return "Invalid verification ID, request a new one";
      case "quota-exceeded":
        return "Quota exceeded, please try again later";
      case "email-already-exists":
        return "The Email address already exists, use a different one";
      case "provider-already-linked":
        return "The account is already linked with another provider";
      case "requires-recent-login":
        return "This operation is sensitive and requires recent authentication. Please login again";
      case "credential-already-in-use":
        return "This credentials is already associated with a different account";
      case "user-mismatch":
        return "The supplied credentials do not correspond to previously signed-in user";
      case "account-exist-with-different-credentials":
        return "An account exists with the same email but different sign-in credentials";
      case "operation-not-allowed":
        return "This operation is not allowed, contact support";
      case "expired-action-code":
        return "Action code has expired, request new";
      case "invalid-action-code":
        return "Action code is invalid, re-check and try again";
      case "missing-action-code":
        return "Action code is missing, provide a valid action code";
      case "user-token-expired":
        return "The user's token has expired, and authentication is required. Please sign in again";
      case "invalid-credentials":
        return "Supplied credentials are malformed or have expired";
      default:
        return "An error occurred with code: $code";
    }
  }
}
