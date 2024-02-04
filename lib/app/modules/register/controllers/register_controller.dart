import 'package:get/get.dart';

import '../../../data/service/auth_service.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/utils.dart';

class RegisterController extends GetxController {
  final AuthService _authService = Get.find<AuthService>();

  final RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  Future<void> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    try {
      _isLoading.value = true;
      final user = await _authService.register(
        email: email,
        password: password,
        firstName: firstName,
        lastName: lastName,
      );
      Get.log(user?.email ?? 'N/A');
      _isLoading.value = false;
      Get.offAllNamed(Routes.home);
    } catch (e) {
      _isLoading.value = false;
      Utils.showErrorSnackBar(
        title: "Registration Failed",
        message: e.toString(),
      );
    }
  }
}
