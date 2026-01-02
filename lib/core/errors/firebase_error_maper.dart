String mapFirebaseError(String code) {
  switch (code) {
    case 'invalid-credential':
      return 'Email or Password is incorrect';
    case 'user-not-found':
      return 'No account found with this email';
    case 'wrong-password':
      return 'Incorrect password';
    case 'email-already-in-use':
      return 'Email already registered';
    case 'invalid-email':
      return 'Invalid email address';
    case 'weak-password':
      return 'Password is too weak';
    case 'network-request-failed':
      return 'No internet connection';
    default:
      return 'Authentication failed';
  }
}
