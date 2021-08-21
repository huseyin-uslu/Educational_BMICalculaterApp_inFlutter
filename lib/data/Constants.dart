import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const Color kCUSTOM_DEFAULT_TEXT_COLOR = Color(0xFF073105);
const Color kBACKGROUND_THE_APP = Color(0xFF055c00);
const Color kCUSTOM_PRIMARY_COLOR_OF_THEME = Color(0xFF1cb314);
const Color kCUSTOM_SECONDARY_COLOR_OF_THEME = Color(0xff94ad93);

const Color kCUSTOM_DEFAULT_2_TEXT_COLOR = Color(0xFFFFFFFF);

final ThemeData kTHEME_DATA_DEFAULT = ThemeData.light().copyWith(
    appBarTheme: AppBarTheme().copyWith(
      centerTitle: true,
      backwardsCompatibility: false,
      backgroundColor: kCUSTOM_PRIMARY_COLOR_OF_THEME,
      systemOverlayStyle: SystemUiOverlayStyle(
          systemNavigationBarColor: kBACKGROUND_THE_APP,
          statusBarColor: kBACKGROUND_THE_APP),
    ),
    applyElevationOverlayColor: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: kBACKGROUND_THE_APP,
    backgroundColor: kBACKGROUND_THE_APP,
    primaryColor: kCUSTOM_PRIMARY_COLOR_OF_THEME,
    secondaryHeaderColor: kCUSTOM_SECONDARY_COLOR_OF_THEME,
    accentColor: kBACKGROUND_THE_APP,
    selectedRowColor: kCUSTOM_PRIMARY_COLOR_OF_THEME,
    bottomNavigationBarTheme: BottomNavigationBarThemeData().copyWith(
      type: BottomNavigationBarType.fixed,
      backgroundColor: kBACKGROUND_THE_APP,
      unselectedItemColor: kCUSTOM_PRIMARY_COLOR_OF_THEME,
      selectedItemColor: kCUSTOM_DEFAULT_2_TEXT_COLOR,
      unselectedIconTheme: IconThemeData().copyWith(
        size: 25,
        color: kCUSTOM_PRIMARY_COLOR_OF_THEME,
      ),
      selectedIconTheme: IconThemeData().copyWith(
        size: 40,
        color: kCUSTOM_DEFAULT_2_TEXT_COLOR,
      ),
      selectedLabelStyle: kDEFAULT_TEXTSTYLE,
    ));

const TextStyle kDEFAULT_TEXTSTYLE = TextStyle(
  fontSize: 20,
  color: kCUSTOM_DEFAULT_TEXT_COLOR,
  fontWeight: FontWeight.normal,
);

const TextStyle kDEFAULT_TEXTSTYLE2 = TextStyle(
  fontSize: 20,
  color: kCUSTOM_DEFAULT_2_TEXT_COLOR,
  fontWeight: FontWeight.bold,
);

const TextStyle kLABEL_DEFAULT_TEXTSTYLE = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: 22.5,
    color: kCUSTOM_DEFAULT_TEXT_COLOR);

const TextStyle kLABEL_DEFAULT_2_TEXTSTYLE = TextStyle(
    fontWeight: FontWeight.w900, fontSize: 40, color: Color(0xFF760404));

const TextStyle kLABEL_DEFAULT_3_TEXTSTYLE = TextStyle(
    fontWeight: FontWeight.w900,
    fontSize: 50,
    color: kCUSTOM_DEFAULT_TEXT_COLOR);
