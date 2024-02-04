import 'package:get/get.dart';

import '../../../data/service/auth_service.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/utils.dart';

class LoginController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();

  final RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  Future<void> loginWithEmail({required String email, required String password}) async {
    try {
      _isLoading.value = true;
      final user = await _authService.login(email, password);
      Get.log(user?.email ?? 'N/A');
      _isLoading.value = false;
      Get.offAllNamed(Routes.home);
    } catch (e) {
      _isLoading.value = false;
      Utils.showErrorSnackBar(
        title: "Login Failed",
        message: e.toString(),
      );
    }
  }

  Future<void> loginWithGoogle() async {
    try {
      _isLoading.value = true;
      final user = await _authService.loginWithGoogle();
      Get.log(user?.email ?? 'N/A');
      _isLoading.value = false;
      Get.offAllNamed(Routes.home);
    } catch (e) {
      _isLoading.value = false;
      Utils.showErrorSnackBar(
        title: "Login Failed",
        message: e.toString(),
      );
    }
  }
}
