import 'package:exogo/features/auth/data/datasources/remote/firebase_auth_service.dart';
import 'package:exogo/features/auth/domain/repository/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';


class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthService service;

  AuthRepositoryImpl(this.service);

  @override
  Future<UserCredential> signIn(String email, String password) {
    return service.signIn(email: email, password: password);
  }

  @override
  Future<UserCredential> signUp(String email, String password) {
    return service.signUp(email: email, password: password);
  }

  @override
  Future<void> forgotPassword(String email) {
    return service.sendPasswordResetEmail(email);
  }

  @override
  Stream<User?> authStateChanges() {
    return service.authStateChanges();
  }

  @override
  User? getCurrentUser() {
    return service.currentUser;
  }

  @override
  Future<void> signOut() {
    return service.signOut();
  }
}
