import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../routes/app_pages.dart';
import '../../../widgets/custom_text_field.dart';
import '../controllers/login_controller.dart';
import 'forgot_password_view.dart';

class LoginView extends GetView<LoginController> {
  LoginView({super.key});

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Login',
                    style: theme.textTheme.displaySmall,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Welcome to My Chat',
                    style: theme.textTheme.titleLarge,
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
                  TextButton(
                    onPressed: () => _showForgotPasswordSheet(context),
                    child: const Text('Forgot Password?'),
                  ),
                  const SizedBox(height: 10),
                  Obx(() => ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(55),
                          backgroundColor: Colors.deepPurpleAccent,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: controller.isLoading ? null : login,
                        child: controller.isLoading
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: Center(child: CircularProgressIndicator(color: Colors.white)),
                              )
                            : const Text('Login'),
                      )),
                  const SizedBox(height: 20),
                  Center(
                    child: Text.rich(
                      TextSpan(
                        text: 'Don\'t have an account? ',
                        children: [
                          TextSpan(
                            text: 'Register',
                            style: TextStyle(
                              color: theme.colorScheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = () => Get.toNamed(Routes.register),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    children: [
                      Expanded(child: Divider()),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text('OR'),
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(55),
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                    ),
                    onPressed: () {},
                    icon: Image.asset('assets/icons/google.png', height: 20),
                    label: const Text('Continue with Google'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void login() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();
      await controller.loginWithEmail(email: email, password: password);
    }
  }

  _showForgotPasswordSheet(BuildContext context) {
    showBarModalBottomSheet(
      context: context,
      builder: (context) => ForgotPasswordView(),
    );
  }
}
