import 'package:flutter/material.dart';
import 'colors.dart';

class TextStyles {
  static TextStyle get labelLarge => const TextStyle(
      fontFamily: 'Lato',
      color: black,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      letterSpacing: .1);
  static TextStyle get text => const TextStyle(
      fontFamily: 'Quicksand',
      fontSize: 18,
      letterSpacing: 2,
      fontWeight: FontWeight.bold,
      color: black);
  static TextStyle get smalltext => const TextStyle(
      fontFamily: 'Quicksand',
      fontSize: 14,
      letterSpacing: 2,
      color: black);
  static TextStyle get toolbarText => const TextStyle( fontFamily: 'libreBaskerville',
      fontSize: 22, fontWeight: FontWeight.w400, color: white);



}