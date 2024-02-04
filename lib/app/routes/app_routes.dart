part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const home = _Paths.home;
  static const login = _Paths.login;
  static const register = _Paths.register;
  static const chat = _Paths.chat;
}

abstract class _Paths {
  _Paths._();
  static const home = '/home';
  static const login = '/login';
  static const register = '/register';
  static const chat = '/chat';
}
