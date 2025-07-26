// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class App_BarTheme {
  App_BarTheme._();

  static const AppBarTheme lightAppBarTheme = AppBarTheme(
    foregroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    elevation: 0,
    backgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),

    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    actionsIconTheme: IconThemeData(color: Colors.black),
    centerTitle: true,
    systemOverlayStyle: SystemUiOverlayStyle.dark,
  );

  static final AppBarTheme darkAppBarTheme = AppBarTheme(
    foregroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    elevation: 0,
    backgroundColor: Colors.grey[900],
    iconTheme: const IconThemeData(color: Colors.white),
    titleTextStyle: const TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    actionsIconTheme: const IconThemeData(color: Colors.white),
    centerTitle: true,
    systemOverlayStyle: SystemUiOverlayStyle.light,
  );
}
