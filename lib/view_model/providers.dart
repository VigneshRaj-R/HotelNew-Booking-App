import 'package:flutter/material.dart';
import 'package:hotelnew/view_model/category/category.dart';
import 'package:hotelnew/view_model/hotel/hotel.dart';
import 'package:hotelnew/view_model/main%20page/main_page_view_model.dart';
import 'package:hotelnew/view_model/register/phone_number.dart';
import 'package:hotelnew/view_model/register/signin_view_model.dart';
import 'package:hotelnew/view_model/register/signup_viewmodel.dart';
import 'package:hotelnew/view_model/search/search_viewmodel.dart';
import 'package:hotelnew/view_model/splash/splash_view_model.dart';
import 'package:hotelnew/view_model/home/home_view_model.dart';
import '../main.dart';
import 'package:provider/provider.dart';

class Providers {
  static Widget providers() {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MainPageViewModel()),
        ChangeNotifierProvider(create: (context) => SigninViewModel()),
        ChangeNotifierProvider(create: (context) => SignUpViewModel()),
        ChangeNotifierProvider(create: (context) => PhoneNumberViewModel()),
        ChangeNotifierProvider(create: (context) => SplashViewModel()),
        ChangeNotifierProvider(create: (context) => HomeViewModel()),
        ChangeNotifierProvider(create: (context) => HotelViewModel()),
        ChangeNotifierProvider(create: (context) => CategoryViewModel()),
        ChangeNotifierProvider(create: (context) => SearchViewModel()),
      ],
      child: const MyApp(),
    );
  }
}
