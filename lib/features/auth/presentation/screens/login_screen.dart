import 'package:exogo/core/extensions/space_extensions.dart';
import 'package:exogo/core/routes/app_route_names.dart';
import 'package:exogo/core/theme/app_colors.dart';
import 'package:exogo/core/utils/validators.dart';
import 'package:exogo/features/auth/presentation/providers/auth_controller_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../widgets/auth_text_field.dart';
import '../widgets/auth_primary_button.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authControllerProvider);
    final controller = ref.read(authControllerProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 6,
              children: [
                40.h,
                Image.asset('assets/images/ecogo.png', height: 50),

                18.h,
                const Text(
                  'Sign in to Flight',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),

                const Text(
                  'Welcome back! Please sign in to continue',
                  style: TextStyle(color: AppColors.grey),
                ),

                32.h,

                AuthTextField(
                  label: 'Email',
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: Validators.email,
                ),
                10.h,
                AuthTextField(
                  label: 'Password',
                  controller: _passwordController,
                  isPassword: true,
                  validator: Validators.password,
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      context.push(AppRouteNames.forgotPassword);
                    },
                    child: const Text('Forgot password?'),
                  ),
                ),

                if (state.error != null)
                  Text(state.error!, style: TextStyle(color: Theme.of(context).colorScheme.error)),

                const Spacer(),

                AuthPrimaryButton(
                  text: 'Log in',
                  isLoading: state.isLoading,
                  onPressed: () {
                    final isValid = _formKey.currentState?.validate() ?? false;

                    if (!isValid) return;
                    controller.login(
                      email: _emailController.text.trim(),
                      password: _passwordController.text.trim(),
                    );
                  },
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        context.go(AppRouteNames.signUp);
                      },
                      child: const Text('Sign up'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
