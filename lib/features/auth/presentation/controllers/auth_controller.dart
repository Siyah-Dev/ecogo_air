import 'package:exogo/features/auth/presentation/controllers/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/legacy.dart';

class AuthController extends StateNotifier<AuthState> {
  AuthController(this._auth) : super(const AuthState());

  final FirebaseAuth _auth;

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      state = state.copyWith(
        isLoading: true,
        error: null,
        message: null,
      );

      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      state = state.copyWith(isLoading: false);
    } on FirebaseAuthException catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.message ?? 'Login failed',
      );
    }
  }

  Future<void> forgotPassword(String email) async {
    if (email.isEmpty) {
      state = state.copyWith(error: 'Please enter email');
      return;
    }

    try {
      state = state.copyWith(
        isLoading: true,
        error: null,
        message: null,
      );

      await _auth.sendPasswordResetEmail(email: email);

      state = state.copyWith(
        isLoading: false,
        message: 'Password reset link sent to your email',
      );
    } on FirebaseAuthException catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.message ?? 'Failed to send reset link',
      );
    }
  }

  void clearMessages() {
    state = state.copyWith(error: null, message: null);
  }
}
