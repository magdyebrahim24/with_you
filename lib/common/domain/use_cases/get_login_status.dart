import 'package:shared_preferences/shared_preferences.dart';

class GetLogInStatus {
  Future<bool> call() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool("isLogIn") ?? false;
  }
}
