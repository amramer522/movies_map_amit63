import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setNotFirstTime() async {
    bool isSuccess = await _prefs.setBool("isFirstTime", false);
    print(isSuccess ? "Success" : "Failed");
  }
  static String get token {
    return _prefs.getString("token") ?? "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wvdGhpbWFyLmFtci5hYWl0LWQuY29tXC9hcGlcL2xvZ2luIiwiaWF0IjoxNzE3MDEwNzIzLCJleHAiOjE3NDg1NDY3MjMsIm5iZiI6MTcxNzAxMDcyMywianRpIjoibTNWT3ZxcWw3Z2dsSVRtdyIsInN1YiI6MzkwLCJwcnYiOiIyM2JkNWM4OTQ5ZjYwMGFkYjM5ZTcwMWM0MDA4NzJkYjdhNTk3NmY3In0.elv6eFEsT08ohNRV_Mevo77MBk3wxKR8gSKBoUfD-SA";
  }
  static String get name {
    return _prefs.getString("name") ?? "";
  }

  static int get age {
    return _prefs.getInt("age") ?? 0;
  }

  static bool get isFirstTime {
    return _prefs.getBool("isFirstTime") ?? true;
  }

  static void logout(){
    _prefs.clear();
  }

}
