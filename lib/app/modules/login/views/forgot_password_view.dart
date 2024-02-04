import 'package:flutter/material.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';

import '../../../widgets/custom_text_field.dart';

class ForgotPasswordView extends StatelessWidget {
  ForgotPasswordView({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: theme.colorScheme.background,
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Forgot Password?',
                style: theme.textTheme.headlineSmall,
              ),
              const SizedBox(height: 10),
              Text(
                'Please enter your email to continue \nwe will send you a link to reset your password',
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: 30),
              CustomTextField(
                controller: _emailController,
                hintText: 'Enter your email',
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icons.email_outlined,
                validator: (email) {
                  if (email!.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!GetUtils.isEmail(email)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(55),
                  backgroundColor: Colors.deepPurpleAccent,
                  foregroundColor: Colors.white,
                ),
                onPressed: () async {},
                child: const Text('Reset Password'),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
