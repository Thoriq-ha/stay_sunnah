import 'package:flutter/material.dart';

import 'my_color.dart';

AppBarTheme myAppBarStyle() => const AppBarTheme(backgroundColor: primaryClr);

InputDecorationTheme myInputDecorationStyle() {
  return InputDecorationTheme(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide.none),
      filled: true,
      fillColor: Colors.grey.withOpacity(0.1));
}

FloatingActionButtonThemeData myFloatingActionButtonStyle() =>
    const FloatingActionButtonThemeData(backgroundColor: primaryClr);
IconThemeData myIconStyle() => const IconThemeData(color: primaryClr);
IconThemeData myIconStyleDark() => const IconThemeData(color: darkcolAccent);

ElevatedButtonThemeData myElevatedButtonThemeStyle() {
  return ElevatedButtonThemeData(
    style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
            const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0)),
        shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0))),
        backgroundColor: MaterialStateProperty.all<Color>(mycolAccent)),
  );
}

Widget verticalSpace(double h) {
  return SizedBox(height: h);
}
