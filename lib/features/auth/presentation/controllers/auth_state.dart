import 'package:firebase_auth/firebase_auth.dart';

class AuthState {
  final bool isLoading;
  final String? error;
  final String? message;
  final UserCredential? userCred;

  const AuthState({
    this.isLoading = false,
    this.error,
    this.message,
    this.userCred,
  });

  AuthState copyWith({
    bool? isLoading,
    String? error,
    String? message,
    UserCredential? userCred,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      message: message,
      userCred: userCred ?? this.userCred,
    );
  }
}
