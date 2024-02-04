import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/custom_text_field.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  RegisterView({super.key});

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.close),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Register',
                  style: theme.textTheme.displaySmall,
                ),
                const SizedBox(height: 10),
                Text(
                  'Create an account to continue',
                  style: theme.textTheme.titleLarge,
                ),
                const SizedBox(height: 30),
                CustomTextField(
                  controller: _firstNameController,
                  hintText: 'Enter your first name',
                  keyboardType: TextInputType.name,
                  prefixIcon: Icons.person_outline,
                  validator: (firstName) {
                    if (firstName!.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: _lastNameController,
                  hintText: 'Enter your last name',
                  keyboardType: TextInputType.name,
                  prefixIcon: Icons.person_outline,
                  validator: (lastName) {
                    if (lastName!.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
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
                const SizedBox(height: 10),
                CustomTextField(
                  controller: _passwordController,
                  hintText: 'Enter your password',
                  obscureText: true,
                  prefixIcon: Icons.lock_outline,
                  validator: (password) {
                    if (password!.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (password.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: _confirmPasswordController,
                  hintText: 'Confirm your password',
                  obscureText: true,
                  prefixIcon: Icons.lock_outline,
                  validator: (confirmPassword) {
                    if (confirmPassword!.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (confirmPassword != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 30),
                Obx(() => ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(55),
                        backgroundColor: Colors.deepPurpleAccent,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: controller.isLoading ? null : register,
                      child: controller.isLoading
                          ? const SizedBox(
                              height: 25,
                              width: 25,
                              child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.white)),
                            )
                          : const Text('Register'),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void register() async {
    if (_formKey.currentState!.validate()) {
      final firstName = _firstNameController.text.trim();
      final lastName = _lastNameController.text.trim();
      final email = _emailController.text.trim();
      final password = _confirmPasswordController.text.trim();
      await controller.register(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
      );
      _formKey.currentState!.reset();
    }
  }
}
