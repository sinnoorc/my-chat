import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
      throw message;
    }
  }

  Future<User?> register({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final User? user = userCredential.user;
      if (user == null) return null;
      await FirebaseChatCore.instance.createUserInFirestore(
        types.User(
          id: user.uid,
          firstName: firstName,
          lastName: lastName,
          imageUrl: user.photoURL ?? 'https://robohash.org/${user.email}.png',
        ),
      );
      return _auth.currentUser;
    } on FirebaseAuthException catch (e) {
      final message = AuthExceptionHelper.getMessage(e);
      throw message;
    }
  }

  Future<User?> loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return null;
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      final User? user = _auth.currentUser;
      if (user == null) return null;
      final userFirestore = FirebaseChatCore.instance.getFirebaseFirestore();
      final userDoc = await userFirestore.collection('users').doc(user.uid).get();
      if (!userDoc.exists) {
        await FirebaseChatCore.instance.createUserInFirestore(
          types.User(
            id: user.uid,
            firstName: user.displayName?.split(' ').first ?? 'First',
            lastName: user.displayName?.split(' ').last ?? 'Last',
            imageUrl: user.photoURL ?? 'https://robohash.org/${user.email}.png',
          ),
        );
      }
      return user;
    } on FirebaseAuthException catch (e) {
      final message = AuthExceptionHelper.getMessage(e);
      throw message;
    }
  }

  Future<void> logout() async => await _auth.signOut();

  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      final message = AuthExceptionHelper.getMessage(e);
      throw message;
    }
  }
}
