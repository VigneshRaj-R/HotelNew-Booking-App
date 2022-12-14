import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../utils/navigations.dart';

class ShowDialogs {
  static final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static popUp(
    String messege, {
    Color color = KColors.kRedColor,
    int milliSec = 2000,
    Color textColor = KColors.kWhiteColor,
  }) {
    rootScaffoldMessengerKey.currentState?.hideCurrentSnackBar();
    rootScaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        duration: Duration(milliseconds: milliSec),
        behavior: SnackBarBehavior.floating,
        backgroundColor: color,
        margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        content: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Text(
            messege,
            style: TextStyle(
              letterSpacing: 1,
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }

  static void dialogBox(
      {required String title,
      required String messege,
      required Function goOn}) async {
    await showDialog(
      context: Navigations.navigatorKey.currentContext!,
      builder: (ctx) {
        return AlertDialog(
          title: Text(
            title,
          ),
          titleTextStyle:
              const TextStyle(fontSize: 24, color: KColors.kBlackColor),
          content: Text(messege),
          contentTextStyle:
              const TextStyle(fontSize: 18, color: KColors.kBlackColor),
          actions: [
            TextButton(
              onPressed: () {
                Navigations.pop();
              },
              child: const Text(
                'No',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            TextButton(
              onPressed: () {
                goOn();
              },
              child: const Text(
                'Yes',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
          ],
        );
      },
    );
  }
}
