import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthExceptionHelper implements Exception {
  static String getMessage(Object e) {
    if (e is FirebaseAuthException) {
      return _handleFirebaseAuthException(e);
    }

    return 'An unexpected error occurred. Please try again.';
  }

  static String _handleFirebaseAuthException(FirebaseAuthException e) {
    Get.log(e.code);
    Get.log(e.message ?? 'error');
    switch (e.code) {
      case 'account-exists-with-different-credential':
        return 'The account already exists with a different credential.';
      case 'invalid-credential':
        return 'Error occurred while accessing credentials. Try again.';
      case 'operation-not-allowed':
        return 'The operation is not allowed. Please enable it in the Firebase console.';
      case 'user-disabled':
        return 'Your account has been disabled by an administrator.';
      case 'user-not-found':
        return 'User not found. Please contact support.';
      case 'wrong-password':
        return 'Wrong password provided. Please try again.';
      case 'invalid-verification-code':
        return 'The verification code entered is invalid.';
      case 'invalid-verification-id':
        return 'The verification ID used to create the phone auth credential is invalid.';
      case 'email-already-in-use':
        return 'The email address is already in use by another account.';
      case 'invalid-email':
        return 'The email address is badly formatted.';
      case 'invalid-phone-number':
        return 'Please enter valid phone number';
      case 'weak-password':
        return 'The password provided is too weak.';
      case 'too-many-requests':
        return 'We have blocked all requests from this device due to unusual activity. Try again later.';

      default:
        return 'Error occurred during sign in. Please try again.';
    }
  }
}
