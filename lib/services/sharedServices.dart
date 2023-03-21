import 'package:shared_preferences/shared_preferences.dart';
class SharedPrefService {
  static late SharedPreferences pref;

  static Future<void> init() async {
    pref = await SharedPreferences.getInstance();
  }
}