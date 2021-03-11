import 'package:flutter/widgets.dart';
import 'package:flutter_cache/flutter_cache.dart' as cache;

class LoginService {
  int _expireInSeconds = 3600;

  Future<void> login(BuildContext context) async {
    cache.write('isLoggedIn', 'true', _expireInSeconds);
    await Navigator.of(context)
        .pushNamedAndRemoveUntil('/home', (route) => false);
  }

  Future user() async {
    return cache.load('user', '{"user": "test", "firstname": "test", "lastname": "test"}');
  }

  Future<void> logout(BuildContext context) async {
    cache.destroy('isLoggedIn');
    cache.destroy('token');
    cache.destroy('user');
    await Navigator.of(context)
        .pushNamedAndRemoveUntil('/login', (route) => false);
  }

  Future isLogin() async {
    return cache.load('isLoggedIn', 'false');
  }
}
