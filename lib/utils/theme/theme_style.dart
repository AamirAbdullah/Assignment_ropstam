import 'package:assignment_ropstam/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: isDarkTheme
            ? AppColor().dashboardBackgroundColor
            : const Color(0xffffffff),
        primaryColorLight: isDarkTheme ? Colors.white : Colors.black,
        primaryColorDark: isDarkTheme ? Colors.black : Colors.white,
        backgroundColor: isDarkTheme ? Colors.black : const Color(0xffF1F5FB),
        dialogBackgroundColor: isDarkTheme ? Colors.white : Colors.black,
        //light color 1
        indicatorColor:
            isDarkTheme ? const Color(0xff404040) : const Color(0xffD0D0D0),
        hintColor:
            isDarkTheme ? const Color(0xffD0D0D0) : const Color(0xff616161),
        //light color 2
        highlightColor:
            isDarkTheme ? const Color(0xffADB3BC) : const Color(0xff2E2E2F),
        hoverColor:
            isDarkTheme ? const Color(0xff2E2E2F) : const Color(0xffADB3BC),

        /// text feild color

        disabledColor: isDarkTheme
            ? const Color(0xff616161)
            : const Color(0xffF4F4F4),
        cardColor: isDarkTheme
            ? const Color(0xffF4F4F4)
            : const Color(0xff616161),
        errorColor: Colors.red,
        canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
        brightness: isDarkTheme ? Brightness.dark : Brightness.light,
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
            colorScheme: isDarkTheme
                ? const ColorScheme.dark()
                : const ColorScheme.light()),
        textTheme:
             GoogleFonts.robotoTextTheme(Theme.of(context).textTheme));
  }
}
