import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../helper/auth_exception_helper.dart';

class AuthService extends GetxService {
  Future<AuthService> init() async => this;

  FirebaseAuth get _auth => FirebaseAuth.instance;
  User? get user => _auth.currentUser;
  Stream<User?> get userStream => _auth.authStateChanges();

  Future<User?> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return _auth.currentUser;
    } on FirebaseAuthException catch (e) {
      final message = AuthExceptionHelper.getMessage(e);
      throw Exception(message);
    }
  }

  Future<User?> register(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return _auth.currentUser;
    } on FirebaseAuthException catch (e) {
      final message = AuthExceptionHelper.getMessage(e);
      throw Exception(message);
    }
  }

  Future<User?> loginWithGoogle() async {
    try {
      final googleProvider = GoogleAuthProvider();
      googleProvider.addScope('email');
      googleProvider.addScope('profile');
      final userCredential = await _auth.signInWithPopup(googleProvider);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      final message = AuthExceptionHelper.getMessage(e);
      throw Exception(message);
    }
  }

  Future<void> logout() async => await _auth.signOut();
}
