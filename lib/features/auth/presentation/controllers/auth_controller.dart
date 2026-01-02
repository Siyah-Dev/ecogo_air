import 'dart:developer';

import 'package:exogo/core/errors/firebase_error_maper.dart';
import 'package:exogo/core/utils/app_snackbar.dart';
import 'package:exogo/features/auth/domain/repository/auth_repository.dart';
import 'package:exogo/features/auth/presentation/controllers/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/legacy.dart';

class AuthController extends StateNotifier<AuthState> {
  final AuthRepository authRepository;
  AuthController(this.authRepository) : super(const AuthState());

  Future<void> signUp({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      state = state.copyWith(isLoading: true, error: null, message: null);

      await authRepository.signUp(email, password);

      state = state.copyWith(isLoading: false);
    } on FirebaseAuthException catch (e) {
      log('it is error: ${e.code}');
      state = state.copyWith(isLoading: false, error: mapFirebaseError(e.code));
      if (context.mounted) {
        AppSnackBar.showError(context, state.error!);
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      if (context.mounted) {
        AppSnackBar.showError(context, state.error!);
      }
    }
  }

  Future<void> login({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      state = state.copyWith(isLoading: true, error: null, message: null);

      await authRepository.signIn(email, password);

      state = state.copyWith(isLoading: false);
    } on FirebaseAuthException catch (e) {
      state = state.copyWith(isLoading: false, error: mapFirebaseError(e.code));
      if (context.mounted) {
        AppSnackBar.showError(context, state.error!);
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      if (context.mounted) {
        AppSnackBar.showError(context, state.error!);
      }
    }
  }

  Future<void> forgotPassword({required BuildContext context, required String email}) async {
    try {
      state = state.copyWith(isLoading: true, error: null, message: null);

      await authRepository.forgotPassword(email);

      state = state.copyWith(isLoading: false, message: 'Password reset link sent to your email');
      if (context.mounted) {
        AppSnackBar.showSuccess(context, state.message!);
      }
    } on FirebaseAuthException catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: mapFirebaseError(e.code),
        
      );
      if (context.mounted) {
        AppSnackBar.showError(context, state.error!);
      }
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      if (context.mounted) {
        AppSnackBar.showError(context, state.error!);
      }
    }
  }

  void clearMessages() {
    state = state.copyWith(error: null, message: null);
  }

  void signOut(){}
}
