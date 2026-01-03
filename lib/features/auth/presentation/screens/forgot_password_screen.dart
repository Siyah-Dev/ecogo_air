import 'package:exogo/core/extensions/space_extensions.dart';
import 'package:exogo/core/utils/validators.dart';
import 'package:exogo/features/auth/presentation/providers/auth_controller_provider.dart';
import 'package:exogo/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForgotPasswordPage extends ConsumerStatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  ConsumerState<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends ConsumerState<ForgotPasswordPage> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authControllerProvider);
    final controller = ref.read(authControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: true),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            20.h,

            Image.asset('assets/images/ecogo.png', height: 50),

            24.h,
            const Text(
              'Forgot Password',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            8.h,
            const Text(
              'Enter your email to receive a reset link',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),

            32.h,

            Form(
              key: _formKey,
              child: AuthTextField(
                label: 'Email',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                validator: Validators.email,
              ),
            ),

            24.h,

            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: state.isLoading
                    ? null
                    : () {
                        final isValid =
                            _formKey.currentState?.validate() ?? false;

                        if (!isValid) return;

                        controller.forgotPassword(
                          context: context,
                          email: _emailController.text.trim(),
                        );
                      },
                child: state.isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text('Send Reset Link'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
