import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {

  Future<List<String>?> getStringList(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(key);
  }

  Future<void> setLogin(final String email, final String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('loginInfo', [email, password]);
  }
}
