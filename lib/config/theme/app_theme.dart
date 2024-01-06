import 'package:ecomap/config/theme/responsive.dart';
import 'package:flutter/material.dart';

class AppTheme {

  static const Color primary =  Color(0xff6ABDA6);
  // static const Color secondary =  Color(0xffE5A000);

  ThemeData getTheme(BuildContext context) => ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.teal.shade200,
      primary: primary,
      // secondary: secondary,
    ),

    textTheme: const TextTheme(
      displaySmall: TextStyle(fontWeight: FontWeight.bold),
      headlineMedium: TextStyle(color: Colors.white),
      titleLarge: TextStyle(fontWeight: FontWeight.bold),
    ),

    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      border: InputBorder.none,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade400, width: Responsive(context).hp(0.12)),
        borderRadius: BorderRadius.circular(Responsive(context).ip(0.5)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade400, width: Responsive(context).hp(0.12)),
        borderRadius: BorderRadius.circular(Responsive(context).ip(0.5)),
      ),
      hintStyle: TextStyle(color: Colors.grey.shade400, fontWeight: FontWeight.normal),
    ),

    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        fixedSize: MaterialStatePropertyAll(Size(double.maxFinite, Responsive(context).hp(6))),
        textStyle: MaterialStatePropertyAll(TextStyle(fontSize: Responsive(context).ip(1.8), fontWeight: FontWeight.bold))
      )
    )
  );
}
