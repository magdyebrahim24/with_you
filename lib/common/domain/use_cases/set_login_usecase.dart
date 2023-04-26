import 'package:shared_preferences/shared_preferences.dart';

class SetLogInUseCase {


  Future<bool?> call(bool isLogIn) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool("isLogIn", isLogIn);
  }
}
