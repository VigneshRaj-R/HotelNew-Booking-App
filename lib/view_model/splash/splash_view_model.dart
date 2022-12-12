import 'package:flutter/material.dart';
import 'package:hotelnew/utils/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../utils/navigations.dart';
import '../../view/screens/main page/main_page.dart';
import '../../view/screens/register/phone_number_screen.dart';

class SplashViewModel extends ChangeNotifier {
  // ==========>>>>>  TO CHECK, IS USER LOGGEDIN OR NOT  <<<<<==========
  Future<void> checkLogin() async {
    final pref = await SharedPreferences.getInstance();
    final isLogggedIn = pref.getBool(KStrings.isLogggedIn);
    if (isLogggedIn == null || isLogggedIn == false) {
      Navigations.pushReplace(const PhoneNumberScreen());
    } else {
      Navigations.pushReplace(const MainPage());
    }
  }
}
