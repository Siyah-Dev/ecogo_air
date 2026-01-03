import 'package:exogo/core/routes/app_route_names.dart';
import 'package:exogo/features/auth/presentation/providers/auth_state_provider.dart';
import 'package:exogo/features/auth/presentation/screens/forgot_password_screen.dart';
import 'package:exogo/features/auth/presentation/screens/login_screen.dart';
import 'package:exogo/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:exogo/features/home/presentation/screens/home_screen.dart';
import 'package:exogo/features/home/presentation/screens/search_screen.dart';
import 'package:exogo/features/splash/presentation/screens/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: AppRouteNames.login,
    redirect: (context, state) {
      final user = FirebaseAuth.instance.currentUser;
      final isAuthRoute =
          state.matchedLocation == AppRouteNames.login ||
          state.matchedLocation == AppRouteNames.forgotPassword ||
          state.matchedLocation == AppRouteNames.signUp;

      if (user == null && !isAuthRoute) {
        return AppRouteNames.login;
      }

      if (user != null && isAuthRoute) {
        return AppRouteNames.homeScreen;
      }

      return null;
    },
    routes: [
      GoRoute(
        path: AppRouteNames.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRouteNames.signUp,
        builder: (context, state) => SignUpScreen(),
      ),
      GoRoute(
        path: AppRouteNames.login,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: AppRouteNames.forgotPassword,
        builder: (context, state) => ForgotPasswordPage(),
      ),
      GoRoute(
        path: AppRouteNames.homeScreen,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: AppRouteNames.searchScreen,
        builder: (context, state) {
          final isDestination = state.extra as bool? ?? false;
          return SearchScreen(isDestination: isDestination);
        },
      ),
    ],
  );
});
