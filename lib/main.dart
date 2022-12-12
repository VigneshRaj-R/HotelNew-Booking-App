import 'package:flutter/material.dart';
import 'package:hotelnew/utils/colors.dart';
import 'package:hotelnew/utils/navigations.dart';
import 'package:hotelnew/view/screens/splash/splash.dart';
import 'package:hotelnew/view/widgets/show_dialogs.dart';
import 'package:hotelnew/view_model/providers.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Providers.providers());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: KColors.primarySwatchColor,
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 0, color: Colors.transparent),
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: KColors.kThemeGreen,
          elevation: 0,
        ),
      ),
      navigatorKey: Navigations.navigatorKey,
      scaffoldMessengerKey: ShowDialogs.rootScaffoldMessengerKey,
      home: const SplashScreen(),
    );
  }
}
