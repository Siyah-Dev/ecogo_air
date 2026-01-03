import 'package:exogo/features/auth/data/datasources/remote/firebase_auth_service.dart';
import 'package:exogo/features/auth/data/repository/auth_repository_impl.dart';
import 'package:exogo/features/auth/domain/repository/auth_repository.dart';
import 'package:exogo/features/auth/presentation/controllers/auth_controller.dart';
import 'package:exogo/features/auth/presentation/controllers/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final firebaseAuthServiceProvider = Provider<FirebaseAuthService>((ref) {
  return FirebaseAuthService();
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final service = ref.read(firebaseAuthServiceProvider);
  return AuthRepositoryImpl(service);
});

final authControllerProvider = StateNotifierProvider<AuthController, AuthState>(
  (ref) {
    final repository = ref.read(authRepositoryProvider);
    return AuthController(repository);
  },
);
