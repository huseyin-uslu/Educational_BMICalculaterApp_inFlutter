import 'package:flutter/material.dart';

const Color kColorTickedButton = Color(0xFF101427);
const Color kColorNotTickedButton = Color(0xFF1D1F33);

const Color kInactiveTextColor = Color(0xFF8D8E98);
const Color kActiveTextColor = Color(0xFFFFFFFF);

const Color kBackgroundScaffoldColor = Color(0xFF090C22);
const Color kColorApplyButton = Color(0xFFEB1555);

const TextStyle kTextStyleOfLabels = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: kInactiveTextColor,
    letterSpacing: 1.5);

const TextStyle kTextStyleOfNeeds = TextStyle(
    fontSize: 40.0,
    fontWeight: FontWeight.w900,
    color: kActiveTextColor,
    letterSpacing: 2.0);

const EdgeInsetsGeometry kEdgeInsetsOfAllContainers =
    EdgeInsets.symmetric(vertical: 2.0, horizontal: 12.5);

enum Gender { Male, Female }
