import 'package:exogo/features/auth/presentation/controllers/auth_controller.dart';
import 'package:exogo/features/auth/presentation/controllers/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/legacy.dart';

final authControllerProvider = StateNotifierProvider<AuthController, AuthState>(
  (ref) => AuthController(FirebaseAuth.instance),
);
